#!/usr/bin/env gosh

(use file.util)
(use gauche.generator)
(use gauche.parameter)
(use scheme.list)
(use srfi-13)
(use srfi-26)
(use srfi-42)

(define-syntax ->
  (syntax-rules ()
    [(_ x) x]
    [(_ x (fn . args) . rest) (-> (fn x . args) . rest)]
    [(_ x fn . rest) (-> (fn x) . rest)]))

(define-syntax ->>
  (syntax-rules ()
    [(_ x) x]
    [(_ x (fn args ...) . rest) (->> (fn args ... x) . rest)]
    [(_ x fn . rest) (->> (fn x) . rest)]))

(define (main args)
  (let ([usage (^[] (usage "CMD [ARG...]"
                           "Extract keywords from Gauche texinfo source files."
                           "Commands:"
                           "    tsv"
                           "    macro"
                           "    specialform"
                           "    qualifier"))]
        [args (cdr args)])
    (if (null? args)
        (usage)
        (let ([cmd (car args)]
              [args (cdr args)])
          (case (string->symbol cmd)
            [(tsv) (build-tsv args)]
            [(macro) (build-macro args)]
            [(specialform) (build-specialform args)]
            [(qualifier) (build-qualifier args)]
            [else (usage)])))))

(define (build-tsv names)
  (when (null? names)
    (usage "tsv [NAME...]"
           "Convert gauche document source files to a TSV table."
           "Args:"
           "    NAME        name of texinfo source file, suffix (.texi) can be omitted"))
  (->> (list-ec [: name names]
                [:let name (if (#/\.texi$/ name)
                               name
                               #"~|name|.texi")]
                [:let gauche-src (sys-getenv "GAUCHE_SRC")]
                [:generator line (->> name
                                      (build-path gauche-src "doc")
                                      (file->line-generator))]
                [if (#/^@def/ line)]
                [:let fields (-> line
                                 (string->fields)
                                 (fields-tidy))]
                (-> (cons name fields)
                    (string-join "\t")))
       (sort)
       (delete-duplicates)
       (for-each print))
  (exit))

(define (build-macro args)
  (when (null? args)
    (usage "macro TSV"
           "Generate vim syntax for Gauche macros."
           "Args:"
           "TSV        TSV file generated by tsv command"))
  (->> (list-ec [:let tsv (car args)]
                [:generator line (file->line-generator tsv)]
                [:let fields (string-split line #\tab)]
                [if (#/^@defmacx?$/ (~ fields 1))]
                (~ fields 3))
       (sort)
       (delete-duplicates)
       (filter (pa$ undefined-keyword-in? #/r7rs\w*SyntaxM?/))
       (filter-map (^[name] (rxmatch-case name
                              [#/^use$/ ()
                               #f]
                              [#/^define-/ ()
                               #"syn keyword r7rsSyntaxM ~name"]
                              [#/!/ ()
                               #"syn keyword r7rsSyntaxM ~name"]
                              [#/^\^c$/ ()
                               "syn match r7rsSyntax /\\^[_a-z]/"]
                              [else
                                #"syn keyword r7rsSyntax ~name"])))
       (for-each print))
  (exit))

(define (build-specialform args)
  (when (null? args)
    (usage "specialform TSV"
           "Generate vim syntax for Gauche specialforms."
           "Args:"
           "TSV        TSV file generated by tsv command"))
  (->> (list-ec [:let tsv (car args)]
                [:generator line (file->line-generator tsv)]
                [:let fields (string-split line #\tab)]
                [if (#/^@defspecx?$/ (~ fields 1))]
                (~ fields 3))
       (sort)
       (delete-duplicates)
       (filter (pa$ undefined-keyword-in? #/r7rs\w*SyntaxM?/))
       (filter-map (^[name] (rxmatch-case name
                              [#/^import$/ ()  ; skip it as it is handled in r7rs(|Gauche)Import
                               #f]
                              [#/^((define|select)-module|export-all|require)$/ ()
                               #"syn keyword r7rsSyntaxM ~name"]
                              [#/^define-/ ()
                               #"syn keyword r7rsSyntaxM ~name"]
                              [else
                                #"syn keyword r7rsSyntax ~name"])))
       (for-each print))
  (exit))

(define (build-qualifier args)
  (when (null? args)
    (usage "qualifier TSV"
           "Generate vim syntax for SRFI-42 qualifiers."
           "Args:"
           "TSV        TSV file generated by tsv command"))
  (->> (list-ec [:let tsv (car args)]
                [:generator line (file->line-generator tsv)]
                [:let fields (string-split line #\tab)]
                [if (and (#/^{ec qualifier}$/ (~ fields 2))
                         (not (#/^:/ (~ fields 3))))]
                (~ fields 3))
       (sort)
       (delete-duplicates)
       (filter (pa$ undefined-keyword-in? #/r7rs\w*SyntaxM?/))
       (filter-map (^[name] (rxmatch-case name
                              [else
                                #"syn keyword r7rsSyntax ~name"])))
       (for-each print))
  (exit))

;; Show usage.
(define (usage synopsis desc . more)
  (let1 pname (car (command-line))
    (parameterize ([current-output-port (current-error-port)])
      (-> `(,#"Usage: ~pname ~synopsis" "" ,desc "" ,@more)
          (string-join "\n")
          (write-string))
      (newline)))
  (exit 1))

;; Split a string into a list of fields.
;; Each field must be either not surrounded by parens or surrounded by paired parens.
;; Example:
;;     (string->fields "a b {c (d e)} f") ==> '("a" "b" "{c (d e)}" "f")
(define (string->fields line)
  (let1 fields (string-split line #/[[:space:]]+/)
    (if (null? fields)
        fields
        (let1 done (list (pop! fields))
          (until (null? fields)
            (let ([current (car done)]
                  [next (pop! fields)])
              (if (or (not (#/^[\(\[{]/ current))
                      (#/^{.*}$/ current)
                      (#/^\(.*\)$/ current)
                      (#/^\[.*\]$/ current))
                  (push! done next)
                  (set! (car done) (string-join (list current next) " ")))))
          (reverse done)))))

;; Format raw fields like '(@def {category} name lispword?)
(define (fields-tidy fields)
  (let-values ([(f1 f2 f3) (apply values (take* fields 3 #t ""))])
    ;; If f2 does not match {category} then it is name
    (unless (#/^{[^\(\)]+}$/ f2)
      (set! f3 f2)
      (set! f2 ""))
    ;; Category name may have inconsistent cases; e.g. {Condition [tT]ype}
    (set! f2 (string-downcase f2))
    ;; Some identifiers are surrounded by {} (e.g. {(setter ...)}).
    (set! f3 (unwrap-setter f3))
    (let1 lispword (if (has-lispword? fields) "lispword" "")
      (list f1 f2 f3 lispword))))

;; Unwrap item enclosed as {(setter ITEM)}.
(define (unwrap-setter wrapped)
  (if-let1 matched (#/{\(setter (.+)\)}/ wrapped)
           (matched 1)
           wrapped))

;; Check whether the raw fields look like '(name arg ... body-ish ...).
;; If the fields contain a syntax that should be added as lispword, they end with something like
;; body ... or clause ....
;; Typical example:
;;     @defspec lambda formals body @dots{}
;; So NF > 4. However, there are false positive with NF > 4:
;;     @defmac cut expr-or-slot expr-or-slot2 @dots{}
;;     @defmac begin0 exp0 exp1 @dots{}
;; These examples are ideally
;;     @defmac cut expr-or-slot @dots{}
;;     @defmac begin0 exp @dots{}
;; By these translation, NF <= 4 and one can distinguish between lispword from others.
(define (has-lispword? fields)
  (let/cc return
    (let ([n (length fields)]
          [threshold 4])
      (unless (> n threshold)
        (return #f))
      (let ([def (first fields)]
            [maybe-name1 (second fields)]
            [maybe-name2 (third fields)]
            [maybe-dots (last fields)])
        ;; define-method and let(rec)?-syntax lack ending "body ..." but have "body".
        (when (any #/^(define-method|let(rec)?-syntax)$/
                   (list maybe-name1 maybe-name2))
          (return #t))
        (when (and (#/^@def(mac|spec)x?$/ def)
                   (#/^@dots\{\}$/ maybe-dots))
          (let* ([sdleif (reverse fields)]
                 [body1 (string-trim-right (third sdleif) #[[:digit:]])]
                 [body2 (string-trim-right (second sdleif) #[[:digit:]])]
                 [threshold (if (string= body1 body2)
                                (+ 1 threshold)
                                threshold)])
            (when (> n threshold)
              (return #t))))))
    #f))

(define (undefined-keyword-in? group word)
  (let* ([word (string-regexp-escape word)]
         [group (cond [(regexp? group) (regexp->string group)]
                      [(string? group) group]
                      [else (x->string group)])]
         [known? (string->regexp #"syn keyword ~|group| (?:.+ )?~|word|(?: |$)")])
    (not (any known? r7rs-keywords))))

;; Escape meta characters in EXTENDED regular expressions.
(define (string-regexp-escape str)
  (regexp-replace-all #/([*.^$+?])/ str "\\\\\\1"))

(define r7rs-keywords
  (list-ec [: file '("./syntax/r7rs.vim"
                     "./syntax/r7rs-large.vim")]
           [:generator line (file->line-generator file)]
           [if (#/syn keyword/ line)]
           line))
