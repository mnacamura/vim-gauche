#!/usr/bin/env bash

set -euo pipefail

TMPD="$(mktemp -d --suffix vimgauche)"
readonly TMPD
cleanup() { rm -rf "$TMPD"; }
trap cleanup ERR SIGTERM EXIT

readonly LIB="$TMPD/lib.awk"

main() {
    if [[ -z "${GAUCHE_SRC+defined}" ]]; then
        echo "Please set GAUCHE_SRC to gauche source path" >&2
        exit 1
    fi

    if [[ -z "${1+defined}" ]]; then
        usage
    fi

    local cmd
    case "$1" in
        ( constant \
        | cise \
        | module \
        | class \
        | syntax \
        | ftplugin \
        )
            cmd="$1"
            shift
            build_"$cmd" "$@"
            ;;
        (*)
            usage
            ;;
    esac
}

usage() {
    cat >&2 <<EOF
Usage: $0 CMD [ARG...]

Commands:
    constant
    module
    class
    syntax
    ftplugin
EOF
    exit 1
}

build_cise() {
    if [[ -z "${1+defined}" ]]; then
        cat >&2 <<EOF
Usage: $0 cise TSV

Generate vim syntax for Gauche CiSE statements, expressions, types, and stub forms.

Args:
    TSV         TSV file generated by $0 tsv
EOF
        exit 1
    fi

    gawk -F'\t' '$3 ~ /^{cise type}$/ { print $4 }' "$1" \
        | sort | uniq \
        | gawk '{ switch ($0) {
                  default:
                      print "syn keyword r7rsCiSEType", $0
                      break
                  }
                }'
    gawk -F'\t' '$3 ~ /^{cise statement}$/ || $3 ~ /^{stub form}$/ { print $4 }' "$1" \
        | sort | uniq \
        | find_undefined_keywords_in 'r7rs\w*SyntaxM?' \
        | gawk '{ switch ($0) {
                  case /(define|decl)/:
                      # Use special color
                      print "syn keyword r7rsCiSESyntaxM", $0
                      break
                  # != contains ! but not mutator
                  case /!$/:
                      # Use special color
                      print "syn keyword r7rsCiSESyntaxM", $0
                      break
                  default:
                      print "syn keyword r7rsCiSESyntax", $0
                      break
                  }
                }'
    gawk -F'\t' '$3 ~ /^{cise expression}$/ { print $4 }' "$1" \
        | sort | uniq \
        | find_undefined_keywords_in 'r7rs(\w*Syntax|Function)M?' \
        | gawk '{ switch ($0) {
                  # != contains ! but not mutator
                  case /!$/:
                      # Use special color
                      print "syn keyword r7rsCiSEFunctionM", $0
                      break
                  default:
                      print "syn keyword r7rsCiSEFunction", $0
                      break
                  }
                }'
}

build_constant() {
    if [[ -z "${1+defined}" ]]; then
        cat >&2 <<EOF
Usage: $0 constant TSV

Generate vim syntax for Gauche constants.

Args:
    TSV         TSV file generated by $0 tsv
EOF
        exit 1
    fi

    gawk -F'\t' '$3 ~ /^{constant}$/ { print $4 }' "$1" \
        | sort | uniq \
        | gawk -i"$LIB" '{ print_with_at_expanded($0) }' \
        | find_undefined_keywords_in 'r7rsConstant' \
        | gawk '{ print "syn keyword r7rsConstant", $0 }'
}

build_module() {
    if [[ -z "${1+defined}" ]]; then
        cat >&2 <<EOF
Usage: $0 module TSV

Generate vim syntax for Gauche module names.

Args:
    TSV         TSV file generated by $0 tsv
EOF
        exit 1
    fi

    gawk -F'\t' '$3 ~ /^{(\w+ )?module}$/ { print $4 }' "$1" \
        | sort | uniq \
        | gawk -i"$LIB" '{ print_with_at_expanded($0) }' \
        | gawk '{ print "syn keyword r7rsGaucheModName", $0 }'
}

build_class() {
    if [[ -z "${1+defined}" ]]; then
        cat >&2 <<EOF
Usage: $0 class TSV

Generate vim syntax for Gauche classes.

Args:
    TSV         TSV file generated by $0 tsv
EOF
        exit 1
    fi

    gawk -F'\t' '$3 ~ /^{((meta|\w+ )?class)}$/ || $3 ~ /{condition type}/ { print $4 }' "$1" \
        | sort | uniq \
        | gawk -i"$LIB" '{ print_with_at_expanded($0) }' \
        | gawk '{ print "syn keyword r7rsClass", $0 }'
}

build_syntax() {
    if [[ -z "${1+defined}" ]]; then
        cat >&2 <<EOF
Usage: $0 syntax PATH [VIM...]

Rebuild syntax/gauche.vim from generated vim files.

Args:
    PATH        path to syntax/gauche.vim
    VIM...      files generated by $0 (macro|specialform|...)
EOF
        exit 1
    fi

    local path="$1"
    shift

    local tmp="$TMPD/syntax.vim"
    {
        sed -n '1, /^" Common expressions {{{1$/ p' "$path" | update_timestamp
        echo
        cat "$@" | sort | uniq
        echo
        sed -n '/^" Special expressions {{{1$/, $ p' "$path"
    } > "$tmp"
    cp "$tmp" "$path"
}

build_ftplugin() {
    if [[ -z "${1+defined}" ]]; then
        cat >&2 <<EOF
Usage: $0 ftplugin PATH TSV

Rebuild ftplugin/gauche.vim from generated vim files.

Args:
    PATH        path to ftplugin/gauche.vim
    TSV         TSV file generated by $0 tsv
EOF
        exit 1
    fi

    local path="$1" tsv="$2"
    shift 2

    local tmp="$TMPD/ftplugin.vim"
    {
        sed -n '1, /^" lispwords {{{$/ p' "$path" | update_timestamp
        echo
        gawk '$4 ~ /lispword/ { print $3 }' "$tsv" \
            | sort | uniq \
            | find_undefined_lispwords \
            | sed -E 's/(.*)/setl lispwords+=\1/'
        echo
        sed -n '/^" }}}$/, $ p' "$path"
    } > "$tmp"
    cp "$tmp" "$path"
}

update_timestamp() {
    sed -E 's/^(.*Last Change: )[0-9]{4}-[0-9]{2}-[0-9]{2}$/\1'"$(date +%Y-%m-%d)/"
}

find_undefined_keywords_in() {
    local groupname="$1" keyword
    while read -r keyword; do
        if ! grep -E "syn keyword $groupname (.+ )?$(esc "$keyword")( |$)" \
               ./syntax/r7rs{,-large}.vim > /dev/null 2>&1
        then
            echo "$keyword"
        fi
    done
}

find_undefined_lispwords() {
    local lispword
    while read -r lispword; do
        if ! grep -E "setl lispwords\+?=(.+,)?$(esc "$lispword")(,|$)" \
               ./ftplugin/r7rs.vim > /dev/null 2>&1
        then
            echo "$lispword"
        fi
    done
}

# Escape meta characters in EXTENDED regular expressions
esc() {
    echo "$1" | sed -E 's@(\*|\.|\^|\$|\+|\?)@\\\1@g'
}

cat > "$LIB" <<'EOF'
BEGIN {
    FS = "\t"
    OFS = "\t"
    ATAT[0] = "u8"
    ATAT[1] = "s8"
    ATAT[2] = "u16"
    ATAT[3] = "s16"
    ATAT[4] = "u32"
    ATAT[5] = "s32"
    ATAT[6] = "u64"
    ATAT[7] = "s64"
    ATAT[8] = "f16"
    ATAT[9] = "f32"
    ATAT[10] = "f64"
    ATAT[11] = "c32"
    ATAT[12] = "c64"
    ATAT[13] = "c128"
    HTML[0] = "a"
    HTML[1] = "abbr"
    HTML[2] = "acronym"
    HTML[3] = "address"
    HTML[4] = "area"
    HTML[5] = "b"
    HTML[6] = "base"
    HTML[7] = "bdo"
    HTML[8] = "big"
    HTML[9] = "blockquote"
    HTML[10] = "body"
    HTML[11] = "br"
    HTML[12] = "button"
    HTML[13] = "caption"
    HTML[14] = "cite"
    HTML[15] = "code"
    HTML[16] = "col"
    HTML[17] = "colgroup"
    HTML[18] = "dd"
    HTML[19] = "del"
    HTML[20] = "dfn"
    HTML[21] = "div"
    HTML[22] = "dl"
    HTML[23] = "dt"
    HTML[24] = "em"
    HTML[25] = "fieldset"
    HTML[26] = "form"
    HTML[27] = "frame"
    HTML[28] = "frameset"
    HTML[29] = "h1"
    HTML[30] = "h2"
    HTML[31] = "h3"
    HTML[32] = "h4"
    HTML[33] = "h5"
    HTML[34] = "h6"
    HTML[35] = "head"
    HTML[36] = "hr"
    HTML[37] = "html"
    HTML[38] = "i"
    HTML[39] = "iframe"
    HTML[40] = "img"
    HTML[41] = "input"
    HTML[42] = "ins"
    HTML[43] = "kbd"
    HTML[44] = "label"
    HTML[45] = "legend"
    HTML[46] = "li"
    HTML[47] = "link"
    HTML[48] = "map"
    HTML[49] = "meta"
    HTML[50] = "noframes"
    HTML[51] = "noscript"
    HTML[52] = "object"
    HTML[53] = "ol"
    HTML[54] = "optgroup"
    HTML[55] = "option"
    HTML[56] = "p"
    HTML[57] = "param"
    HTML[58] = "pre"
    HTML[59] = "q"
    HTML[60] = "samp"
    HTML[61] = "script"
    HTML[62] = "select"
    HTML[63] = "small"
    HTML[64] = "span"
    HTML[65] = "strong"
    HTML[66] = "style"
    HTML[67] = "sub"
    HTML[68] = "sup"
    HTML[69] = "table"
    HTML[70] = "tbody"
    HTML[71] = "td"
    HTML[72] = "textarea"
    HTML[73] = "tfoot"
    HTML[74] = "th"
    HTML[75] = "thead"
    HTML[76] = "title"
    HTML[77] = "tr"
    HTML[78] = "tt"
    HTML[79] = "ul"
    HTML[80] = "var"
}
function basename(path) {
    sub(".*/", "", path)
    return path
}
function trim_num(word) {
    sub("[0-9]+$", "", word)
    return word
}
function unwrap(field,    m) {
    if (match(field, /^{\(\w+ (.+)\)}$/, m))
        return m[1]
    return field
}
function print_with_at_expanded(line,    i, _line) {
    switch (line) {
    case /@@/:
        for (i in ATAT) {
            _line = line
            gsub(/@@/, ATAT[i], _line)
            print _line
        }
        break
    case /html:@var{element}/:
        for (i in HTML) {
            _line = line
            gsub(/@var{element}/, HTML[i], _line)
            print _line
        }
        break
    default:
        print line
        break
    }
}
EOF

main "$@"
