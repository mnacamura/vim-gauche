#!/usr/bin/env bash

author='Mitsuhiro Nakamura'
email='m.nacamura@gmail.com'
homepage='https://github.com/mnacamura/vim-gauche'

readonly author email homepage

read -r -d '' common_meta <<EOF
" Language: Scheme (Gauche)
" Last Change: $(date +"%Y-%m-%d")
" Author: $author <$email>
" URL: $homepage
" License: Public domain
" Notes: To enable this plugin, set filetype=scheme and (b|g):is_gauche=1.
EOF

set -euo pipefail

show_usage() {
    cat >&2 <<-EOF
	Usage: $0 CMD [ARG...]
        
	Commands:
	    data
	    macro
	    specialform
	    function
	    variable
	    constant
	    comparator
	    syntax
	    ftplugin
	EOF
}

check_gauche_doc() {
    if [ -z "${GAUCHE_DOC+defined}" ]; then
        echo "Please set GAUCHE_DOC to gauche doc path (*.texi are there)" >&2
        exit 1
    fi
}

check_vim_runtime() {
    if [ -z "${VIM_RUNTIME+defined}" ]; then
        echo "Please set VIM_RUNTIME to vim runtime path" >&2
        exit 1
    fi
}

esc() {
    echo "$1" | sed -e 's@\(\*\|\+\|\.\|\^\|\$\)@\\\1@g'
}

build_data() {
    check_gauche_doc

    set +o pipefail
    find "$GAUCHE_DOC" -name '*.texi' \
                       ! -name 'gauche-dev.texi' \
                       -exec grep '^@def' {} \; \
        | sort \
        | uniq
    set -o pipefail
}

build_macro() {
    check_vim_runtime

    if [ -z "${1+defined}" ]; then
        echo " Usage: $0 macro FILE, where FILE is generated by $0 data" >&2
        exit 1
    fi

    local mac
    awk '/^@defmacx?/ { print $2 }' "$1" | sort | uniq | while read -r mac; do
        if [ "$mac" = '^c' ]; then
            # ^c where c is one of [_a-z] is a macro in gauche
            echo "syn match gaucheMacro /\^[_a-z]/"
        elif ! grep "^syn keyword scheme\\w*Syntax $(esc "$mac")\$" \
            "$VIM_RUNTIME"/syntax/scheme.vim > /dev/null 2>&1
        then
            echo "syn keyword gaucheMacro ${mac/@@/@}"
        fi
    done
}

build_specialform() {
    check_vim_runtime

    if [ -z "${1+defined}" ]; then
        echo " Usage: $0 specialform FILE, where FILE is generated by $0 data" >&2
        exit 1
    fi

    local spec
    awk '/^@defspecx?/ { print $2 }' "$1" | sort | uniq | while read -r spec; do
        if ! grep "^syn keyword scheme\\w*Syntax $(esc "$spec")\$" \
            "$VIM_RUNTIME"/syntax/scheme.vim > /dev/null 2>&1
        then
            echo "syn keyword gaucheSpecialForm ${spec/@@/@}"
        fi
    done
}

build_function() {
    check_vim_runtime

    if [ -z "${1+defined}" ]; then
        echo " Usage: $0 function FILE, where FILE is generated by $0 data" >&2
        exit 1
    fi

    local fun
    awk '/^@defunx?/ { \
             if ( match($0, /^@defunx? {\(setter (.+)\)}/, m) ) { print m[1] } \
             else { print $2 } \
         }' "$1" | sort | uniq | while read -r fun; do
        if ! grep "^syn keyword schemeFunction $(esc "$fun")\$" \
            "$VIM_RUNTIME"/syntax/scheme.vim > /dev/null 2>&1
        then
            echo "syn keyword gaucheFunction ${fun/@@/@}"
        fi
    done
}

build_variable() {
    check_vim_runtime

    if [ -z "${1+defined}" ]; then
        echo " Usage: $0 variable FILE, where FILE is generated by $0 data" >&2
        exit 1
    fi

    local var
    awk '/^@defvarx?/ { print $2 }' "$1" | sort | uniq | while read -r var; do
        if ! grep "^syn keyword schemeConstant $(esc "$var")\$" \
            "$VIM_RUNTIME"/syntax/scheme.vim > /dev/null 2>&1
        then
            echo "syn keyword gaucheVariable ${var/@@/@}"
        fi
    done
}

build_constant() {
    check_vim_runtime

    if [ -z "${1+defined}" ]; then
        echo " Usage: $0 constant FILE, where FILE is generated by $0 data" >&2
        exit 1
    fi

    local var
    awk '/^@defvrx? {Constant}/ { print $3 }' "$1" | sort | uniq | while read -r var; do
        if ! grep "^syn keyword schemeConstant $(esc "$var")\$" \
            "$VIM_RUNTIME"/syntax/scheme.vim > /dev/null 2>&1
        then
            echo "syn keyword gaucheConstant ${var/@@/@}"
        fi
    done
}

build_comparator() {
    check_vim_runtime

    if [ -z "${1+defined}" ]; then
        echo " Usage: $0 comparator FILE, where FILE is generated by $0 data" >&2
        exit 1
    fi

    local var
    awk '/^@defvrx? {Comparator}/ { print $3 }' "$1" | sort | uniq | while read -r var; do
        if ! grep "^syn keyword schemeConstant $(esc "$var")\$" \
            "$VIM_RUNTIME"/syntax/scheme.vim > /dev/null 2>&1
        then
            echo "syn keyword gaucheComparator ${var/@@/@}"
        fi
    done
}

build_syntax() {
    if [ "$#" -eq 0 ]; then
        echo " Usage: $0 syntax [FILE...], where FILE is generated by $0 macro etc." >&2
        exit 1
    fi

    cat <<-EOF
	" Vim syntax file
	$common_meta
	
	if !exists('b:did_scheme_syntax')
	  finish
	endif
	EOF

    local file
    for file in "$@"; do
        echo
        cat "$file"
    done

    echo
    cat <<-EOF
	hi def link gaucheMacro schemeSyntax
	hi def link gaucheSpecialForm schemeSpecialSyntax
	hi def link gaucheFunction schemeFunction
	hi def link gaucheVariable schemeConstant
	hi def link gaucheConstant schemeConstant
	hi def link gaucheComparator schemeConstant
	EOF
}

build_ftplugin() {
    if [ "$#" -eq 0 ]; then
        echo " Usage: $0 ftplugin [FILE...], where FILE is generated by $0 macro etc." >&2
        exit 1
    fi

    cat <<-EOF
	" Vim filetype plugin file
	$common_meta
	
	if !exists('b:did_scheme_ftplugin')
	  finish
	endif
	
	EOF

    local word
    awk '{ print $4 }' "$@" \
        | awk '/\<(|r|g)let(|rec)(|1|\*)(|-)/ || /-let(|rec)(|1|\*)\>/ \
            || /\<define(|-)/ || /-define\>/ \
            || /\<(|rx)match(|-)/ || /-match\>/ \
            || /\<(|e)case(|-)/ || /-case\>/ \
            || /\<lambda(|-)/ || /-lambda(|\*)\>/ \
            || /^set!($|-)/ || ( /-set!$/ && $0 !~ /char-set!$/ ) \
            || /\<do(-|times|list)/' \
        | sort \
        | uniq \
        | while read -r word; do
        if ! grep -F "setl lispwords+=$word" \
            "$VIM_RUNTIME"/ftplugin/scheme.vim > /dev/null 2>&1
        then
            echo "setl lispwords+=$word"
        fi
    done
}

if [ -z "${1+defined}" ]; then
    show_usage
    exit 1
fi

case "$1" in
    data)
        build_data
        ;;
    macro)
        shift
        build_macro "$@"
        ;;
    specialform)
        shift
        build_specialform "$@"
        ;;
    function)
        shift
        build_function "$@"
        ;;
    variable)
        shift
        build_variable "$@"
        ;;
    constant)
        shift
        build_constant "$@"
        ;;
    comparator)
        shift
        build_comparator "$@"
        ;;
    syntax)
        shift
        build_syntax "$@"
        ;;
    ftplugin)
        shift
        build_ftplugin "$@"
        ;;
    *)
        show_usage
        exit 1
        ;;
esac
