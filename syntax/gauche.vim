" Vim syntax file
" Language: Scheme (Gauche)
" Last Change: 2020-05-20
" Author: Mitsuhiro Nakamura <m.nacamura@gmail.com>
" URL: https://github.com/mnacamura/vim-gauche
" License: Public domain
" Notes: To enable this plugin, set filetype=scheme and (b|g):is_gauche=1.

if !exists('b:did_scheme_syntax')
  finish
endif

syn keyword schemeSyntax $
syn match schemeSyntax /\^[_a-z]/
syn keyword schemeSyntax address-family
syn keyword schemeSyntax address-info
syn keyword schemeSyntax and-let*
syn keyword schemeSyntax and-let1
syn keyword schemeSyntax any?-ec
syn keyword schemeSyntax append-ec
syn keyword schemeSyntax apropos
syn keyword schemeSyntax assume
syn keyword schemeSyntax assume-type
syn keyword schemeSyntax autoload
syn keyword schemeSyntax begin0
syn keyword schemeSyntax case-lambda
syn keyword schemeSyntax cgen-with-cpp-condition
syn keyword schemeSyntax chibi-test
syn keyword schemeSyntax cond-expand
syn keyword schemeSyntax cond-list
syn keyword schemeSyntax condition
syn keyword schemeSyntax cut
syn keyword schemeSyntax cute
syn keyword schemeSyntax debug-funcall
syn keyword schemeSyntax debug-print
syn keyword schemeSyntax dec!
syn keyword schemeSyntax define-cise-expr
syn keyword schemeSyntax define-cise-macro
syn keyword schemeSyntax define-cise-stmt
syn keyword schemeSyntax define-cise-toplevel
syn keyword schemeSyntax define-class
syn keyword schemeSyntax define-condition-type
syn keyword schemeSyntax define-dict-interface
syn keyword schemeSyntax define-generic
syn keyword schemeSyntax define-library
syn keyword schemeSyntax define-method
syn keyword schemeSyntax define-record-type
syn keyword schemeSyntax define-stream
syn keyword schemeSyntax define-values
syn keyword schemeSyntax do-ec
syn keyword schemeSyntax do-generator
syn keyword schemeSyntax dolist
syn keyword schemeSyntax dotimes
syn keyword schemeSyntax dynamic-lambda
syn keyword schemeSyntax ecase
syn keyword schemeSyntax endianness
syn keyword schemeSyntax every?-ec
syn keyword schemeSyntax extend
syn keyword schemeSyntax first-ec
syn keyword schemeSyntax fluid-let
syn keyword schemeSyntax fold-ec
syn keyword schemeSyntax fold3-ec
syn keyword schemeSyntax get-keyword*
syn keyword schemeSyntax get-optional
syn keyword schemeSyntax glet*
syn keyword schemeSyntax glet1
syn keyword schemeSyntax guard
syn keyword schemeSyntax if-let1
syn keyword schemeSyntax if-not=?
syn keyword schemeSyntax if3
syn keyword schemeSyntax if<=?
syn keyword schemeSyntax if<?
syn keyword schemeSyntax if=?
syn keyword schemeSyntax if>=?
syn keyword schemeSyntax if>?
syn keyword schemeSyntax inc!
syn keyword schemeSyntax ip-protocol
syn keyword schemeSyntax last-ec
syn keyword schemeSyntax lcons
syn keyword schemeSyntax lcons*
syn keyword schemeSyntax let
syn keyword schemeSyntax let*-values
syn keyword schemeSyntax let-args
syn keyword schemeSyntax let-keywords
syn keyword schemeSyntax let-keywords*
syn keyword schemeSyntax let-optionals*
syn keyword schemeSyntax let-string-start+end
syn keyword schemeSyntax let-values
syn keyword schemeSyntax let/cc
syn keyword schemeSyntax let1
syn keyword schemeSyntax list-ec
syn keyword schemeSyntax llist*
syn keyword schemeSyntax make-option-parser
syn keyword schemeSyntax match
syn keyword schemeSyntax match-define
syn keyword schemeSyntax match-lambda
syn keyword schemeSyntax match-lambda*
syn keyword schemeSyntax match-let
syn keyword schemeSyntax match-let*
syn keyword schemeSyntax match-let1
syn keyword schemeSyntax match-letrec
syn keyword schemeSyntax max-ec
syn keyword schemeSyntax message-type
syn keyword schemeSyntax min-ec
syn keyword schemeSyntax parameterize
syn keyword schemeSyntax parse-options
syn keyword schemeSyntax pop!
syn keyword schemeSyntax product-ec
syn keyword schemeSyntax push!
syn keyword schemeSyntax quasirename
syn keyword schemeSyntax rec
syn keyword schemeSyntax require-extension
syn keyword schemeSyntax reset
syn keyword schemeSyntax rlet1
syn keyword schemeSyntax rx
syn keyword schemeSyntax rxmatch-case
syn keyword schemeSyntax rxmatch-cond
syn keyword schemeSyntax rxmatch-if
syn keyword schemeSyntax rxmatch-let
syn keyword schemeSyntax set!-values
syn keyword schemeSyntax shift
syn keyword schemeSyntax shutdown-method
syn keyword schemeSyntax socket-domain
syn keyword schemeSyntax ssax:make-elem-parser
syn keyword schemeSyntax ssax:make-parser
syn keyword schemeSyntax ssax:make-pi-parser
syn keyword schemeSyntax stream
syn keyword schemeSyntax stream+
syn keyword schemeSyntax stream-cons
syn keyword schemeSyntax stream-delay
syn keyword schemeSyntax stream-lambda
syn keyword schemeSyntax stream-let
syn keyword schemeSyntax stream-match
syn keyword schemeSyntax stream-of
syn keyword schemeSyntax string-append-ec
syn keyword schemeSyntax string-ec
syn keyword schemeSyntax sum-ec
syn keyword schemeSyntax syntax-error
syn keyword schemeSyntax syntax-errorf
syn keyword schemeSyntax test*
syn keyword schemeSyntax time
syn keyword schemeSyntax until
syn keyword schemeSyntax unwind-protect
syn keyword schemeSyntax update!
syn keyword schemeSyntax use
syn keyword schemeSyntax values->list
syn keyword schemeSyntax values-ref
syn keyword schemeSyntax vector-ec
syn keyword schemeSyntax vector-of-length-ec
syn keyword schemeSyntax while
syn keyword schemeSyntax with-builder
syn keyword schemeSyntax with-iterator
syn keyword schemeSyntax with-signal-handlers
syn keyword schemeSyntax with-time-counter
syn keyword schemeSyntax xml-token-head
syn keyword schemeSyntax xml-token-kind

syn keyword schemeSyntaxSyntax %macroexpand
syn keyword schemeSyntaxSyntax %macroexpand-1
syn keyword schemeSyntaxSyntax ^
syn keyword schemeSyntaxSyntax add-load-path
syn keyword schemeSyntaxSyntax and
syn keyword schemeSyntaxSyntax begin
syn keyword schemeSyntaxSyntax case
syn keyword schemeSyntaxSyntax cond
syn keyword schemeSyntaxSyntax current-module
syn keyword schemeSyntaxSyntax define
syn keyword schemeSyntaxSyntax define-constant
syn keyword schemeSyntaxSyntax define-in-module
syn keyword schemeSyntaxSyntax define-inline
syn keyword schemeSyntaxSyntax define-macro
syn keyword schemeSyntaxSyntax define-module
syn keyword schemeSyntaxSyntax define-syntax
syn keyword schemeSyntaxSyntax delay
syn keyword schemeSyntaxSyntax delay-force
syn keyword schemeSyntaxSyntax do
syn keyword schemeSyntaxSyntax er-macro-transformer
syn keyword schemeSyntaxSyntax export
syn keyword schemeSyntaxSyntax export-all
syn keyword schemeSyntaxSyntax if
syn keyword schemeSyntaxSyntax import
syn keyword schemeSyntaxSyntax include
syn keyword schemeSyntaxSyntax include-ci
syn keyword schemeSyntaxSyntax lambda
syn keyword schemeSyntaxSyntax lazy
syn keyword schemeSyntaxSyntax let
syn keyword schemeSyntaxSyntax let*
syn keyword schemeSyntaxSyntax let-syntax
syn keyword schemeSyntaxSyntax letrec
syn keyword schemeSyntaxSyntax letrec*
syn keyword schemeSyntaxSyntax letrec-syntax
syn keyword schemeSyntaxSyntax or
syn keyword schemeSyntaxSyntax quasiquote
syn keyword schemeSyntaxSyntax quote
syn keyword schemeSyntaxSyntax receive
syn keyword schemeSyntaxSyntax require
syn keyword schemeSyntaxSyntax select-module
syn keyword schemeSyntaxSyntax set!
syn keyword schemeSyntaxSyntax syntax-rules
syn keyword schemeSyntaxSyntax unless
syn keyword schemeSyntaxSyntax unquote
syn keyword schemeSyntaxSyntax unquote-splicing
syn keyword schemeSyntaxSyntax when
syn keyword schemeSyntaxSyntax with-cf-subst
syn keyword schemeSyntaxSyntax with-module

syn keyword schemeConstant *argv*
syn keyword schemeConstant *load-path*
syn keyword schemeConstant *primes*
syn keyword schemeConstant *program-name*
syn keyword schemeConstant *rfc2396-unreserved-char-set*
syn keyword schemeConstant *rfc3986-unreserved-char-set*
syn keyword schemeConstant *rfc822-atext-chars*
syn keyword schemeConstant *rfc822-standard-tokenizers*
syn keyword schemeConstant *small-prime-bound*
syn keyword schemeConstant *test-error*
syn keyword schemeConstant *test-report-error*
syn keyword schemeConstant 1/pi
syn keyword schemeConstant 180/pi
syn keyword schemeConstant @vector-comparator
syn keyword schemeConstant AF_INET
syn keyword schemeConstant AF_INET6
syn keyword schemeConstant AF_UNIX
syn keyword schemeConstant BACKGROUND_BLUE
syn keyword schemeConstant BACKGROUND_GREEN
syn keyword schemeConstant BACKGROUND_INTENSITY
syn keyword schemeConstant BACKGROUND_RED
syn keyword schemeConstant CTRL_BREAK_EVENT
syn keyword schemeConstant CTRL_C_EVENT
syn keyword schemeConstant ENABLE_ECHO_INPUT
syn keyword schemeConstant ENABLE_LINE_INPUT
syn keyword schemeConstant ENABLE_MOUSE_INPUT
syn keyword schemeConstant ENABLE_PROCESSED_INPUT
syn keyword schemeConstant ENABLE_PROCESSED_OUTPUT
syn keyword schemeConstant ENABLE_WINDOW_INPUT
syn keyword schemeConstant ENABLE_WRAP_AT_EOL_OUTPUT
syn keyword schemeConstant FILE_SHARE_READ
syn keyword schemeConstant FILE_SHARE_WRITE
syn keyword schemeConstant FOREGROUND_BLUE
syn keyword schemeConstant FOREGROUND_GREEN
syn keyword schemeConstant FOREGROUND_INTENSITY
syn keyword schemeConstant FOREGROUND_RED
syn keyword schemeConstant GDBM_CACHESIZE
syn keyword schemeConstant GDBM_CENTFREE
syn keyword schemeConstant GDBM_COALESCEBLKS
syn keyword schemeConstant GDBM_FAST
syn keyword schemeConstant GDBM_FASTMODE
syn keyword schemeConstant GDBM_INSERT
syn keyword schemeConstant GDBM_NEWDB
syn keyword schemeConstant GDBM_NOLOCK
syn keyword schemeConstant GDBM_READER
syn keyword schemeConstant GDBM_REPLACE
syn keyword schemeConstant GDBM_SYNC
syn keyword schemeConstant GDBM_SYNCMODE
syn keyword schemeConstant GDBM_WRCREAT
syn keyword schemeConstant GDBM_WRITER
syn keyword schemeConstant GENERIC_READ
syn keyword schemeConstant GENERIC_WRITE
syn keyword schemeConstant LC_ALL
syn keyword schemeConstant LC_COLLATE
syn keyword schemeConstant LC_CTYPE
syn keyword schemeConstant LC_MONETARY
syn keyword schemeConstant LC_NUMERIC
syn keyword schemeConstant LC_TIME
syn keyword schemeConstant MSG_CTRUNC
syn keyword schemeConstant MSG_DONTROUTE
syn keyword schemeConstant MSG_EOR
syn keyword schemeConstant MSG_OOB
syn keyword schemeConstant MSG_PEEK
syn keyword schemeConstant MSG_TRUNC
syn keyword schemeConstant MSG_WAITALL
syn keyword schemeConstant PF_INET
syn keyword schemeConstant PF_INET6
syn keyword schemeConstant PF_UNIX
syn keyword schemeConstant RAND_MAX
syn keyword schemeConstant SIGABRT
syn keyword schemeConstant SIGALRM
syn keyword schemeConstant SIGBUS
syn keyword schemeConstant SIGCHLD
syn keyword schemeConstant SIGCONT
syn keyword schemeConstant SIGFPE
syn keyword schemeConstant SIGHUP
syn keyword schemeConstant SIGILL
syn keyword schemeConstant SIGINT
syn keyword schemeConstant SIGIO
syn keyword schemeConstant SIGIOT
syn keyword schemeConstant SIGKILL
syn keyword schemeConstant SIGPIPE
syn keyword schemeConstant SIGPOLL
syn keyword schemeConstant SIGPROF
syn keyword schemeConstant SIGPWR
syn keyword schemeConstant SIGQUIT
syn keyword schemeConstant SIGSEGV
syn keyword schemeConstant SIGSTKFLT
syn keyword schemeConstant SIGSTOP
syn keyword schemeConstant SIGTERM
syn keyword schemeConstant SIGTRAP
syn keyword schemeConstant SIGTSTP
syn keyword schemeConstant SIGTTIN
syn keyword schemeConstant SIGTTOU
syn keyword schemeConstant SIGURG
syn keyword schemeConstant SIGUSR1
syn keyword schemeConstant SIGUSR2
syn keyword schemeConstant SIGVTALRM
syn keyword schemeConstant SIGWINCH
syn keyword schemeConstant SIGXCPU
syn keyword schemeConstant SIGXFSZ
syn keyword schemeConstant SOCK_DGRAM
syn keyword schemeConstant SOCK_RAW
syn keyword schemeConstant SOCK_STREAM
syn keyword schemeConstant SOL_IP
syn keyword schemeConstant SOL_SOCKET
syn keyword schemeConstant SOL_TCP
syn keyword schemeConstant SO_BROADCAST
syn keyword schemeConstant SO_ERROR
syn keyword schemeConstant SO_KEEPALIVE
syn keyword schemeConstant SO_OOBINLINE
syn keyword schemeConstant SO_PRIORITY
syn keyword schemeConstant SO_REUSEADDR
syn keyword schemeConstant SO_TYPE
syn keyword schemeConstant STD_ERROR_HANDLE
syn keyword schemeConstant STD_INPUT_HANDLE
syn keyword schemeConstant STD_OUTPUT_HANDLE
syn keyword schemeConstant Z_ASCII
syn keyword schemeConstant Z_BEST_COMPRESSION
syn keyword schemeConstant Z_BEST_SPEED
syn keyword schemeConstant Z_BINARY
syn keyword schemeConstant Z_DEFAULT_COMPRESSION
syn keyword schemeConstant Z_DEFAULT_STRATEGY
syn keyword schemeConstant Z_FILTERED
syn keyword schemeConstant Z_FIXED
syn keyword schemeConstant Z_HUFFMAN_ONLY
syn keyword schemeConstant Z_NO_COMPRESSION
syn keyword schemeConstant Z_RLE
syn keyword schemeConstant Z_TEXT
syn keyword schemeConstant Z_UNKNOWN
syn keyword schemeConstant boolean-comparator
syn keyword schemeConstant bytevector-comparator
syn keyword schemeConstant char-ci-comparator
syn keyword schemeConstant char-comparator
syn keyword schemeConstant char-set:C
syn keyword schemeConstant char-set:Cc
syn keyword schemeConstant char-set:Cf
syn keyword schemeConstant char-set:Cn
syn keyword schemeConstant char-set:Co
syn keyword schemeConstant char-set:Cs
syn keyword schemeConstant char-set:L
syn keyword schemeConstant char-set:Ll
syn keyword schemeConstant char-set:Lm
syn keyword schemeConstant char-set:Lo
syn keyword schemeConstant char-set:Lt
syn keyword schemeConstant char-set:Lu
syn keyword schemeConstant char-set:M
syn keyword schemeConstant char-set:Mc
syn keyword schemeConstant char-set:Me
syn keyword schemeConstant char-set:Mn
syn keyword schemeConstant char-set:N
syn keyword schemeConstant char-set:Nd
syn keyword schemeConstant char-set:Nl
syn keyword schemeConstant char-set:No
syn keyword schemeConstant char-set:P
syn keyword schemeConstant char-set:Pc
syn keyword schemeConstant char-set:Pd
syn keyword schemeConstant char-set:Pe
syn keyword schemeConstant char-set:Pf
syn keyword schemeConstant char-set:Pi
syn keyword schemeConstant char-set:Po
syn keyword schemeConstant char-set:Ps
syn keyword schemeConstant char-set:S
syn keyword schemeConstant char-set:Sc
syn keyword schemeConstant char-set:Sk
syn keyword schemeConstant char-set:Sm
syn keyword schemeConstant char-set:So
syn keyword schemeConstant char-set:Z
syn keyword schemeConstant char-set:Zl
syn keyword schemeConstant char-set:Zp
syn keyword schemeConstant char-set:Zs
syn keyword schemeConstant char-set:ascii
syn keyword schemeConstant char-set:ascii-blank
syn keyword schemeConstant char-set:ascii-control
syn keyword schemeConstant char-set:ascii-digit
syn keyword schemeConstant char-set:ascii-graphic
syn keyword schemeConstant char-set:ascii-letter
syn keyword schemeConstant char-set:ascii-letter+digit
syn keyword schemeConstant char-set:ascii-lower-case
syn keyword schemeConstant char-set:ascii-printing
syn keyword schemeConstant char-set:ascii-punctuation
syn keyword schemeConstant char-set:ascii-symbol
syn keyword schemeConstant char-set:ascii-upper-case
syn keyword schemeConstant char-set:ascii-whitespace
syn keyword schemeConstant char-set:ascii-word
syn keyword schemeConstant char-set:blank
syn keyword schemeConstant char-set:digit
syn keyword schemeConstant char-set:empty
syn keyword schemeConstant char-set:full
syn keyword schemeConstant char-set:graphic
syn keyword schemeConstant char-set:hex-digit
syn keyword schemeConstant char-set:iso-control
syn keyword schemeConstant char-set:letter
syn keyword schemeConstant char-set:letter+digit
syn keyword schemeConstant char-set:lower-case
syn keyword schemeConstant char-set:printing
syn keyword schemeConstant char-set:punctuation
syn keyword schemeConstant char-set:symbol
syn keyword schemeConstant char-set:title-case
syn keyword schemeConstant char-set:upper-case
syn keyword schemeConstant char-set:whitespace
syn keyword schemeConstant char-set:word
syn keyword schemeConstant complex-comparator
syn keyword schemeConstant default-comparator
syn keyword schemeConstant default-random-source
syn keyword schemeConstant e
syn keyword schemeConstant edn-comparator
syn keyword schemeConstant eq-comparator
syn keyword schemeConstant equal-comparator
syn keyword schemeConstant eqv-comparator
syn keyword schemeConstant exact-integer-comparator
syn keyword schemeConstant fl-1/e
syn keyword schemeConstant fl-1/log-10
syn keyword schemeConstant fl-1/log-2
syn keyword schemeConstant fl-1/log-phi
syn keyword schemeConstant fl-1/pi
syn keyword schemeConstant fl-1/sqrt-2
syn keyword schemeConstant fl-2/pi
syn keyword schemeConstant fl-2/sqrt-pi
syn keyword schemeConstant fl-2pi
syn keyword schemeConstant fl-4thrt-2
syn keyword schemeConstant fl-cbrt-2
syn keyword schemeConstant fl-cbrt-3
syn keyword schemeConstant fl-cos-1
syn keyword schemeConstant fl-degree
syn keyword schemeConstant fl-e
syn keyword schemeConstant fl-e-2
syn keyword schemeConstant fl-e-euler
syn keyword schemeConstant fl-e-pi/4
syn keyword schemeConstant fl-epsilon
syn keyword schemeConstant fl-euler
syn keyword schemeConstant fl-fast-fl+*
syn keyword schemeConstant fl-gamma-1/2
syn keyword schemeConstant fl-gamma-1/3
syn keyword schemeConstant fl-gamma-2/3
syn keyword schemeConstant fl-greatest
syn keyword schemeConstant fl-integer-exponent-nan
syn keyword schemeConstant fl-integer-exponent-zero
syn keyword schemeConstant fl-least
syn keyword schemeConstant fl-log-10
syn keyword schemeConstant fl-log-2
syn keyword schemeConstant fl-log-3
syn keyword schemeConstant fl-log-phi
syn keyword schemeConstant fl-log-pi
syn keyword schemeConstant fl-log10-e
syn keyword schemeConstant fl-log2-e
syn keyword schemeConstant fl-phi
syn keyword schemeConstant fl-pi
syn keyword schemeConstant fl-pi-squared
syn keyword schemeConstant fl-pi/2
syn keyword schemeConstant fl-pi/4
syn keyword schemeConstant fl-sin-1
syn keyword schemeConstant fl-sqrt-10
syn keyword schemeConstant fl-sqrt-2
syn keyword schemeConstant fl-sqrt-3
syn keyword schemeConstant fl-sqrt-5
syn keyword schemeConstant fx-greatest
syn keyword schemeConstant fx-least
syn keyword schemeConstant fx-width
syn keyword schemeConstant hashmap-comparator
syn keyword schemeConstant integer-comparator
syn keyword schemeConstant list-comparator
syn keyword schemeConstant mapping-comparator
syn keyword schemeConstant number-comparator
syn keyword schemeConstant pair-comparator
syn keyword schemeConstant pi
syn keyword schemeConstant pi/180
syn keyword schemeConstant pi/2
syn keyword schemeConstant pi/4
syn keyword schemeConstant rational-comparator
syn keyword schemeConstant real-comparator
syn keyword schemeConstant ssax:Prefix-XML
syn keyword schemeConstant stream-null
syn keyword schemeConstant string-ci-comparator
syn keyword schemeConstant string-comparator
syn keyword schemeConstant time-duration
syn keyword schemeConstant time-monotonic
syn keyword schemeConstant time-process
syn keyword schemeConstant time-tai
syn keyword schemeConstant time-thread
syn keyword schemeConstant time-utc
syn keyword schemeConstant uvector-comparator
syn keyword schemeConstant vector-comparator
