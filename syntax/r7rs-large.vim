" Vim syntax file
" Language: Scheme (R7RS)
" Last Change: 2020-06-08
" Author: Mitsuhiro Nakamura <m.nacamura@gmail.com>
" URL: https://github.com/mnacamura/vim-r7rs-syntax
" License: MIT

if !exists('b:did_r7rs_syntax')
  finish
endif

" (scheme list) SRFI-1 {{{1
syn keyword r7rsProc xcons cons* list-tabulate circular-list iota
syn keyword r7rsProc proper-list? circular-list? dotted-list? not-pair? null-list? list=
syn keyword r7rsProc first second third fourth fifth sixth seventh eighth ninth tenth
syn keyword r7rsProc car+cdr take drop take-right drop-right split-at
syn keyword r7rsProc last last-pair length+ concatenate append-reverse
syn keyword r7rsProc zip unzip1 unzip2 unzip3 unzip4 unzip5 count
syn keyword r7rsProc fold unfold pair-fold reduce fold-right unfold-right pair-fold-right
syn keyword r7rsProc reduce-right append-map pair-for-each filter-map map-in-order
syn keyword r7rsProc filter partition remove find find-tail any every list-index
syn keyword r7rsProc take-while drop-while span break delete delete-duplicates
syn keyword r7rsProc alist-cons alist-copy alist-delete
syn keyword r7rsProc lset<= lset= lset-adjoin lset-union lset-intersection lset-difference
syn keyword r7rsProc lset-xor lset-diff+intersection
syn keyword r7rsProcM take! drop-right! split-at! append! concatenate! reverse! append-reverse!
syn keyword r7rsProcM append-map! map! filter! partition! remove! take-while! span! break!
syn keyword r7rsProcM delete! delete-duplicates! alist-delete!
syn keyword r7rsProcM lset-union! lset-intersection! lset-difference! lset-xor!
syn keyword r7rsProcM lset-diff+intersection!

" (scheme vector) SRFI-133 {{{1
syn keyword r7rsProc vector-unfold vector-unfold-right vector-reverse-copy vector-concatenate
syn keyword r7rsProc vector-append-subvectors vector-empty? vector=
syn keyword r7rsProc vector-fold vector-fold-right vector-map! vector-count vector-cumulate
syn keyword r7rsProc vector-index vector-index-right vector-skip vector-skip-right
syn keyword r7rsProc vector-binary-search vector-any vector-every vector-partition
syn keyword r7rsProc reverse-vector->list reverse-list->vector
syn keyword r7rsProcM vector-swap! vector-reverse! vector-reverse-copy! vector-unfold!
syn keyword r7rsProcM vector-unfold-right!

" (scheme vector @) SRFI-160 {{{1
syn clear r7rsVecB
syn cluster r7rsDataSimple remove=r7rsVecB add=r7rsVecU
syn region r7rsVecU matchgroup=r7rsDelim start=/#[su]\%(8\|16\|32\|64\)(/ end=/)/ contains=r7rsErr,@r7rsComs,r7rsNum
syn region r7rsVecU matchgroup=r7rsDelim start=/#f\%(32\|64\)(/ end=/)/ contains=r7rsErr,@r7rsComs,r7rsNum
syn region r7rsVecU matchgroup=r7rsDelim start=/#c\%(64\|128\)(/ end=/)/ contains=r7rsErr,@r7rsComs,r7rsNum

" s8 {{{2
syn keyword r7rsProc make-s8vector
syn keyword r7rsProc s8vector
syn keyword r7rsProc s8vector-unfold
syn keyword r7rsProc s8vector-unfold-right
syn keyword r7rsProc s8vector-copy
syn keyword r7rsProc s8vector-reverse-copy
syn keyword r7rsProc s8vector-append
syn keyword r7rsProc s8vector-concatenate
syn keyword r7rsProc s8vector-append-subvectors
syn keyword r7rsProc s8?
syn keyword r7rsProc s8vector?
syn keyword r7rsProc s8vector-empty?
syn keyword r7rsProc s8vector=
syn keyword r7rsProc s8vector-ref
syn keyword r7rsProc s8vector-length
syn keyword r7rsProc s8vector-take
syn keyword r7rsProc s8vector-take-right
syn keyword r7rsProc s8vector-drop
syn keyword r7rsProc s8vector-drop-right
syn keyword r7rsProc s8vector-segment
syn keyword r7rsProc s8vector-fold
syn keyword r7rsProc s8vector-fold-right
syn keyword r7rsProc s8vector-map
syn keyword r7rsProcM s8vector-map!
syn keyword r7rsProc s8vector-for-each
syn keyword r7rsProc s8vector-count
syn keyword r7rsProc s8vector-cumulate
syn keyword r7rsProc s8vector-take-while
syn keyword r7rsProc s8vector-take-while-right
syn keyword r7rsProc s8vector-drop-while
syn keyword r7rsProc s8vector-drop-while-right
syn keyword r7rsProc s8vector-index
syn keyword r7rsProc s8vector-index-right
syn keyword r7rsProc s8vector-skip
syn keyword r7rsProc s8vector-skip-right
syn keyword r7rsProc s8vector-any
syn keyword r7rsProc s8vector-every
syn keyword r7rsProc s8vector-partition
syn keyword r7rsProc s8vector-filter
syn keyword r7rsProc s8vector-remove
syn keyword r7rsProcM s8vector-set!
syn keyword r7rsProcM s8vector-swap!
syn keyword r7rsProcM s8vector-fill!
syn keyword r7rsProcM s8vector-reverse!
syn keyword r7rsProcM s8vector-copy!
syn keyword r7rsProcM s8vector-reverse-copy!
syn keyword r7rsProcM s8vector-unfold!
syn keyword r7rsProcM s8vector-unfold-right!
syn keyword r7rsProc s8vector->list
syn keyword r7rsProc reverse-s8vector->list
syn keyword r7rsProc list->s8vector
syn keyword r7rsProc reverse-list->s8vector
syn keyword r7rsProc s8vector->vector
syn keyword r7rsProc vector->s8vector
syn keyword r7rsProc make-s8vector-generator
syn keyword r7rsProc s8vector-comparator
syn keyword r7rsProc write-s8vector

" u8 {{{2
syn keyword r7rsProc make-u8vector
syn keyword r7rsProc u8vector
syn keyword r7rsProc u8vector-unfold
syn keyword r7rsProc u8vector-unfold-right
syn keyword r7rsProc u8vector-copy
syn keyword r7rsProc u8vector-reverse-copy
syn keyword r7rsProc u8vector-append
syn keyword r7rsProc u8vector-concatenate
syn keyword r7rsProc u8vector-append-subvectors
syn keyword r7rsProc u8?
syn keyword r7rsProc u8vector?
syn keyword r7rsProc u8vector-empty?
syn keyword r7rsProc u8vector=
syn keyword r7rsProc u8vector-ref
syn keyword r7rsProc u8vector-length
syn keyword r7rsProc u8vector-take
syn keyword r7rsProc u8vector-take-right
syn keyword r7rsProc u8vector-drop
syn keyword r7rsProc u8vector-drop-right
syn keyword r7rsProc u8vector-segment
syn keyword r7rsProc u8vector-fold
syn keyword r7rsProc u8vector-fold-right
syn keyword r7rsProc u8vector-map
syn keyword r7rsProcM u8vector-map!
syn keyword r7rsProc u8vector-for-each
syn keyword r7rsProc u8vector-count
syn keyword r7rsProc u8vector-cumulate
syn keyword r7rsProc u8vector-take-while
syn keyword r7rsProc u8vector-take-while-right
syn keyword r7rsProc u8vector-drop-while
syn keyword r7rsProc u8vector-drop-while-right
syn keyword r7rsProc u8vector-index
syn keyword r7rsProc u8vector-index-right
syn keyword r7rsProc u8vector-skip
syn keyword r7rsProc u8vector-skip-right
syn keyword r7rsProc u8vector-any
syn keyword r7rsProc u8vector-every
syn keyword r7rsProc u8vector-partition
syn keyword r7rsProc u8vector-filter
syn keyword r7rsProc u8vector-remove
syn keyword r7rsProcM u8vector-set!
syn keyword r7rsProcM u8vector-swap!
syn keyword r7rsProcM u8vector-fill!
syn keyword r7rsProcM u8vector-reverse!
syn keyword r7rsProcM u8vector-copy!
syn keyword r7rsProcM u8vector-reverse-copy!
syn keyword r7rsProcM u8vector-unfold!
syn keyword r7rsProcM u8vector-unfold-right!
syn keyword r7rsProc u8vector->list
syn keyword r7rsProc reverse-u8vector->list
syn keyword r7rsProc list->u8vector
syn keyword r7rsProc reverse-list->u8vector
syn keyword r7rsProc u8vector->vector
syn keyword r7rsProc vector->u8vector
syn keyword r7rsProc make-u8vector-generator
syn keyword r7rsProc u8vector-comparator
syn keyword r7rsProc write-u8vector

" s16 {{{2
syn keyword r7rsProc make-s16vector
syn keyword r7rsProc s16vector
syn keyword r7rsProc s16vector-unfold
syn keyword r7rsProc s16vector-unfold-right
syn keyword r7rsProc s16vector-copy
syn keyword r7rsProc s16vector-reverse-copy
syn keyword r7rsProc s16vector-append
syn keyword r7rsProc s16vector-concatenate
syn keyword r7rsProc s16vector-append-subvectors
syn keyword r7rsProc s16?
syn keyword r7rsProc s16vector?
syn keyword r7rsProc s16vector-empty?
syn keyword r7rsProc s16vector=
syn keyword r7rsProc s16vector-ref
syn keyword r7rsProc s16vector-length
syn keyword r7rsProc s16vector-take
syn keyword r7rsProc s16vector-take-right
syn keyword r7rsProc s16vector-drop
syn keyword r7rsProc s16vector-drop-right
syn keyword r7rsProc s16vector-segment
syn keyword r7rsProc s16vector-fold
syn keyword r7rsProc s16vector-fold-right
syn keyword r7rsProc s16vector-map
syn keyword r7rsProcM s16vector-map!
syn keyword r7rsProc s16vector-for-each
syn keyword r7rsProc s16vector-count
syn keyword r7rsProc s16vector-cumulate
syn keyword r7rsProc s16vector-take-while
syn keyword r7rsProc s16vector-take-while-right
syn keyword r7rsProc s16vector-drop-while
syn keyword r7rsProc s16vector-drop-while-right
syn keyword r7rsProc s16vector-index
syn keyword r7rsProc s16vector-index-right
syn keyword r7rsProc s16vector-skip
syn keyword r7rsProc s16vector-skip-right
syn keyword r7rsProc s16vector-any
syn keyword r7rsProc s16vector-every
syn keyword r7rsProc s16vector-partition
syn keyword r7rsProc s16vector-filter
syn keyword r7rsProc s16vector-remove
syn keyword r7rsProcM s16vector-set!
syn keyword r7rsProcM s16vector-swap!
syn keyword r7rsProcM s16vector-fill!
syn keyword r7rsProcM s16vector-reverse!
syn keyword r7rsProcM s16vector-copy!
syn keyword r7rsProcM s16vector-reverse-copy!
syn keyword r7rsProcM s16vector-unfold!
syn keyword r7rsProcM s16vector-unfold-right!
syn keyword r7rsProc s16vector->list
syn keyword r7rsProc reverse-s16vector->list
syn keyword r7rsProc list->s16vector
syn keyword r7rsProc reverse-list->s16vector
syn keyword r7rsProc s16vector->vector
syn keyword r7rsProc vector->s16vector
syn keyword r7rsProc make-s16vector-generator
syn keyword r7rsProc s16vector-comparator
syn keyword r7rsProc write-s16vector

" u16 {{{2
syn keyword r7rsProc make-u16vector
syn keyword r7rsProc u16vector
syn keyword r7rsProc u16vector-unfold
syn keyword r7rsProc u16vector-unfold-right
syn keyword r7rsProc u16vector-copy
syn keyword r7rsProc u16vector-reverse-copy
syn keyword r7rsProc u16vector-append
syn keyword r7rsProc u16vector-concatenate
syn keyword r7rsProc u16vector-append-subvectors
syn keyword r7rsProc u16?
syn keyword r7rsProc u16vector?
syn keyword r7rsProc u16vector-empty?
syn keyword r7rsProc u16vector=
syn keyword r7rsProc u16vector-ref
syn keyword r7rsProc u16vector-length
syn keyword r7rsProc u16vector-take
syn keyword r7rsProc u16vector-take-right
syn keyword r7rsProc u16vector-drop
syn keyword r7rsProc u16vector-drop-right
syn keyword r7rsProc u16vector-segment
syn keyword r7rsProc u16vector-fold
syn keyword r7rsProc u16vector-fold-right
syn keyword r7rsProc u16vector-map
syn keyword r7rsProcM u16vector-map!
syn keyword r7rsProc u16vector-for-each
syn keyword r7rsProc u16vector-count
syn keyword r7rsProc u16vector-cumulate
syn keyword r7rsProc u16vector-take-while
syn keyword r7rsProc u16vector-take-while-right
syn keyword r7rsProc u16vector-drop-while
syn keyword r7rsProc u16vector-drop-while-right
syn keyword r7rsProc u16vector-index
syn keyword r7rsProc u16vector-index-right
syn keyword r7rsProc u16vector-skip
syn keyword r7rsProc u16vector-skip-right
syn keyword r7rsProc u16vector-any
syn keyword r7rsProc u16vector-every
syn keyword r7rsProc u16vector-partition
syn keyword r7rsProc u16vector-filter
syn keyword r7rsProc u16vector-remove
syn keyword r7rsProcM u16vector-set!
syn keyword r7rsProcM u16vector-swap!
syn keyword r7rsProcM u16vector-fill!
syn keyword r7rsProcM u16vector-reverse!
syn keyword r7rsProcM u16vector-copy!
syn keyword r7rsProcM u16vector-reverse-copy!
syn keyword r7rsProcM u16vector-unfold!
syn keyword r7rsProcM u16vector-unfold-right!
syn keyword r7rsProc u16vector->list
syn keyword r7rsProc reverse-u16vector->list
syn keyword r7rsProc list->u16vector
syn keyword r7rsProc reverse-list->u16vector
syn keyword r7rsProc u16vector->vector
syn keyword r7rsProc vector->u16vector
syn keyword r7rsProc make-u16vector-generator
syn keyword r7rsProc u16vector-comparator
syn keyword r7rsProc write-u16vector

" s32 {{{2
syn keyword r7rsProc make-s32vector
syn keyword r7rsProc s32vector
syn keyword r7rsProc s32vector-unfold
syn keyword r7rsProc s32vector-unfold-right
syn keyword r7rsProc s32vector-copy
syn keyword r7rsProc s32vector-reverse-copy
syn keyword r7rsProc s32vector-append
syn keyword r7rsProc s32vector-concatenate
syn keyword r7rsProc s32vector-append-subvectors
syn keyword r7rsProc s32?
syn keyword r7rsProc s32vector?
syn keyword r7rsProc s32vector-empty?
syn keyword r7rsProc s32vector=
syn keyword r7rsProc s32vector-ref
syn keyword r7rsProc s32vector-length
syn keyword r7rsProc s32vector-take
syn keyword r7rsProc s32vector-take-right
syn keyword r7rsProc s32vector-drop
syn keyword r7rsProc s32vector-drop-right
syn keyword r7rsProc s32vector-segment
syn keyword r7rsProc s32vector-fold
syn keyword r7rsProc s32vector-fold-right
syn keyword r7rsProc s32vector-map
syn keyword r7rsProcM s32vector-map!
syn keyword r7rsProc s32vector-for-each
syn keyword r7rsProc s32vector-count
syn keyword r7rsProc s32vector-cumulate
syn keyword r7rsProc s32vector-take-while
syn keyword r7rsProc s32vector-take-while-right
syn keyword r7rsProc s32vector-drop-while
syn keyword r7rsProc s32vector-drop-while-right
syn keyword r7rsProc s32vector-index
syn keyword r7rsProc s32vector-index-right
syn keyword r7rsProc s32vector-skip
syn keyword r7rsProc s32vector-skip-right
syn keyword r7rsProc s32vector-any
syn keyword r7rsProc s32vector-every
syn keyword r7rsProc s32vector-partition
syn keyword r7rsProc s32vector-filter
syn keyword r7rsProc s32vector-remove
syn keyword r7rsProcM s32vector-set!
syn keyword r7rsProcM s32vector-swap!
syn keyword r7rsProcM s32vector-fill!
syn keyword r7rsProcM s32vector-reverse!
syn keyword r7rsProcM s32vector-copy!
syn keyword r7rsProcM s32vector-reverse-copy!
syn keyword r7rsProcM s32vector-unfold!
syn keyword r7rsProcM s32vector-unfold-right!
syn keyword r7rsProc s32vector->list
syn keyword r7rsProc reverse-s32vector->list
syn keyword r7rsProc list->s32vector
syn keyword r7rsProc reverse-list->s32vector
syn keyword r7rsProc s32vector->vector
syn keyword r7rsProc vector->s32vector
syn keyword r7rsProc make-s32vector-generator
syn keyword r7rsProc s32vector-comparator
syn keyword r7rsProc write-s32vector

" u32 {{{2
syn keyword r7rsProc make-u32vector
syn keyword r7rsProc u32vector
syn keyword r7rsProc u32vector-unfold
syn keyword r7rsProc u32vector-unfold-right
syn keyword r7rsProc u32vector-copy
syn keyword r7rsProc u32vector-reverse-copy
syn keyword r7rsProc u32vector-append
syn keyword r7rsProc u32vector-concatenate
syn keyword r7rsProc u32vector-append-subvectors
syn keyword r7rsProc u32?
syn keyword r7rsProc u32vector?
syn keyword r7rsProc u32vector-empty?
syn keyword r7rsProc u32vector=
syn keyword r7rsProc u32vector-ref
syn keyword r7rsProc u32vector-length
syn keyword r7rsProc u32vector-take
syn keyword r7rsProc u32vector-take-right
syn keyword r7rsProc u32vector-drop
syn keyword r7rsProc u32vector-drop-right
syn keyword r7rsProc u32vector-segment
syn keyword r7rsProc u32vector-fold
syn keyword r7rsProc u32vector-fold-right
syn keyword r7rsProc u32vector-map
syn keyword r7rsProcM u32vector-map!
syn keyword r7rsProc u32vector-for-each
syn keyword r7rsProc u32vector-count
syn keyword r7rsProc u32vector-cumulate
syn keyword r7rsProc u32vector-take-while
syn keyword r7rsProc u32vector-take-while-right
syn keyword r7rsProc u32vector-drop-while
syn keyword r7rsProc u32vector-drop-while-right
syn keyword r7rsProc u32vector-index
syn keyword r7rsProc u32vector-index-right
syn keyword r7rsProc u32vector-skip
syn keyword r7rsProc u32vector-skip-right
syn keyword r7rsProc u32vector-any
syn keyword r7rsProc u32vector-every
syn keyword r7rsProc u32vector-partition
syn keyword r7rsProc u32vector-filter
syn keyword r7rsProc u32vector-remove
syn keyword r7rsProcM u32vector-set!
syn keyword r7rsProcM u32vector-swap!
syn keyword r7rsProcM u32vector-fill!
syn keyword r7rsProcM u32vector-reverse!
syn keyword r7rsProcM u32vector-copy!
syn keyword r7rsProcM u32vector-reverse-copy!
syn keyword r7rsProcM u32vector-unfold!
syn keyword r7rsProcM u32vector-unfold-right!
syn keyword r7rsProc u32vector->list
syn keyword r7rsProc reverse-u32vector->list
syn keyword r7rsProc list->u32vector
syn keyword r7rsProc reverse-list->u32vector
syn keyword r7rsProc u32vector->vector
syn keyword r7rsProc vector->u32vector
syn keyword r7rsProc make-u32vector-generator
syn keyword r7rsProc u32vector-comparator
syn keyword r7rsProc write-u32vector

" s64 {{{2
syn keyword r7rsProc make-s64vector
syn keyword r7rsProc s64vector
syn keyword r7rsProc s64vector-unfold
syn keyword r7rsProc s64vector-unfold-right
syn keyword r7rsProc s64vector-copy
syn keyword r7rsProc s64vector-reverse-copy
syn keyword r7rsProc s64vector-append
syn keyword r7rsProc s64vector-concatenate
syn keyword r7rsProc s64vector-append-subvectors
syn keyword r7rsProc s64?
syn keyword r7rsProc s64vector?
syn keyword r7rsProc s64vector-empty?
syn keyword r7rsProc s64vector=
syn keyword r7rsProc s64vector-ref
syn keyword r7rsProc s64vector-length
syn keyword r7rsProc s64vector-take
syn keyword r7rsProc s64vector-take-right
syn keyword r7rsProc s64vector-drop
syn keyword r7rsProc s64vector-drop-right
syn keyword r7rsProc s64vector-segment
syn keyword r7rsProc s64vector-fold
syn keyword r7rsProc s64vector-fold-right
syn keyword r7rsProc s64vector-map
syn keyword r7rsProcM s64vector-map!
syn keyword r7rsProc s64vector-for-each
syn keyword r7rsProc s64vector-count
syn keyword r7rsProc s64vector-cumulate
syn keyword r7rsProc s64vector-take-while
syn keyword r7rsProc s64vector-take-while-right
syn keyword r7rsProc s64vector-drop-while
syn keyword r7rsProc s64vector-drop-while-right
syn keyword r7rsProc s64vector-index
syn keyword r7rsProc s64vector-index-right
syn keyword r7rsProc s64vector-skip
syn keyword r7rsProc s64vector-skip-right
syn keyword r7rsProc s64vector-any
syn keyword r7rsProc s64vector-every
syn keyword r7rsProc s64vector-partition
syn keyword r7rsProc s64vector-filter
syn keyword r7rsProc s64vector-remove
syn keyword r7rsProcM s64vector-set!
syn keyword r7rsProcM s64vector-swap!
syn keyword r7rsProcM s64vector-fill!
syn keyword r7rsProcM s64vector-reverse!
syn keyword r7rsProcM s64vector-copy!
syn keyword r7rsProcM s64vector-reverse-copy!
syn keyword r7rsProcM s64vector-unfold!
syn keyword r7rsProcM s64vector-unfold-right!
syn keyword r7rsProc s64vector->list
syn keyword r7rsProc reverse-s64vector->list
syn keyword r7rsProc list->s64vector
syn keyword r7rsProc reverse-list->s64vector
syn keyword r7rsProc s64vector->vector
syn keyword r7rsProc vector->s64vector
syn keyword r7rsProc make-s64vector-generator
syn keyword r7rsProc s64vector-comparator
syn keyword r7rsProc write-s64vector

" u64 {{{2
syn keyword r7rsProc make-u64vector
syn keyword r7rsProc u64vector
syn keyword r7rsProc u64vector-unfold
syn keyword r7rsProc u64vector-unfold-right
syn keyword r7rsProc u64vector-copy
syn keyword r7rsProc u64vector-reverse-copy
syn keyword r7rsProc u64vector-append
syn keyword r7rsProc u64vector-concatenate
syn keyword r7rsProc u64vector-append-subvectors
syn keyword r7rsProc u64?
syn keyword r7rsProc u64vector?
syn keyword r7rsProc u64vector-empty?
syn keyword r7rsProc u64vector=
syn keyword r7rsProc u64vector-ref
syn keyword r7rsProc u64vector-length
syn keyword r7rsProc u64vector-take
syn keyword r7rsProc u64vector-take-right
syn keyword r7rsProc u64vector-drop
syn keyword r7rsProc u64vector-drop-right
syn keyword r7rsProc u64vector-segment
syn keyword r7rsProc u64vector-fold
syn keyword r7rsProc u64vector-fold-right
syn keyword r7rsProc u64vector-map
syn keyword r7rsProcM u64vector-map!
syn keyword r7rsProc u64vector-for-each
syn keyword r7rsProc u64vector-count
syn keyword r7rsProc u64vector-cumulate
syn keyword r7rsProc u64vector-take-while
syn keyword r7rsProc u64vector-take-while-right
syn keyword r7rsProc u64vector-drop-while
syn keyword r7rsProc u64vector-drop-while-right
syn keyword r7rsProc u64vector-index
syn keyword r7rsProc u64vector-index-right
syn keyword r7rsProc u64vector-skip
syn keyword r7rsProc u64vector-skip-right
syn keyword r7rsProc u64vector-any
syn keyword r7rsProc u64vector-every
syn keyword r7rsProc u64vector-partition
syn keyword r7rsProc u64vector-filter
syn keyword r7rsProc u64vector-remove
syn keyword r7rsProcM u64vector-set!
syn keyword r7rsProcM u64vector-swap!
syn keyword r7rsProcM u64vector-fill!
syn keyword r7rsProcM u64vector-reverse!
syn keyword r7rsProcM u64vector-copy!
syn keyword r7rsProcM u64vector-reverse-copy!
syn keyword r7rsProcM u64vector-unfold!
syn keyword r7rsProcM u64vector-unfold-right!
syn keyword r7rsProc u64vector->list
syn keyword r7rsProc reverse-u64vector->list
syn keyword r7rsProc list->u64vector
syn keyword r7rsProc reverse-list->u64vector
syn keyword r7rsProc u64vector->vector
syn keyword r7rsProc vector->u64vector
syn keyword r7rsProc make-u64vector-generator
syn keyword r7rsProc u64vector-comparator
syn keyword r7rsProc write-u64vector

" f32 {{{2
syn keyword r7rsProc make-f32vector
syn keyword r7rsProc f32vector
syn keyword r7rsProc f32vector-unfold
syn keyword r7rsProc f32vector-unfold-right
syn keyword r7rsProc f32vector-copy
syn keyword r7rsProc f32vector-reverse-copy
syn keyword r7rsProc f32vector-append
syn keyword r7rsProc f32vector-concatenate
syn keyword r7rsProc f32vector-append-subvectors
syn keyword r7rsProc f32?
syn keyword r7rsProc f32vector?
syn keyword r7rsProc f32vector-empty?
syn keyword r7rsProc f32vector=
syn keyword r7rsProc f32vector-ref
syn keyword r7rsProc f32vector-length
syn keyword r7rsProc f32vector-take
syn keyword r7rsProc f32vector-take-right
syn keyword r7rsProc f32vector-drop
syn keyword r7rsProc f32vector-drop-right
syn keyword r7rsProc f32vector-segment
syn keyword r7rsProc f32vector-fold
syn keyword r7rsProc f32vector-fold-right
syn keyword r7rsProc f32vector-map
syn keyword r7rsProcM f32vector-map!
syn keyword r7rsProc f32vector-for-each
syn keyword r7rsProc f32vector-count
syn keyword r7rsProc f32vector-cumulate
syn keyword r7rsProc f32vector-take-while
syn keyword r7rsProc f32vector-take-while-right
syn keyword r7rsProc f32vector-drop-while
syn keyword r7rsProc f32vector-drop-while-right
syn keyword r7rsProc f32vector-index
syn keyword r7rsProc f32vector-index-right
syn keyword r7rsProc f32vector-skip
syn keyword r7rsProc f32vector-skip-right
syn keyword r7rsProc f32vector-any
syn keyword r7rsProc f32vector-every
syn keyword r7rsProc f32vector-partition
syn keyword r7rsProc f32vector-filter
syn keyword r7rsProc f32vector-remove
syn keyword r7rsProcM f32vector-set!
syn keyword r7rsProcM f32vector-swap!
syn keyword r7rsProcM f32vector-fill!
syn keyword r7rsProcM f32vector-reverse!
syn keyword r7rsProcM f32vector-copy!
syn keyword r7rsProcM f32vector-reverse-copy!
syn keyword r7rsProcM f32vector-unfold!
syn keyword r7rsProcM f32vector-unfold-right!
syn keyword r7rsProc f32vector->list
syn keyword r7rsProc reverse-f32vector->list
syn keyword r7rsProc list->f32vector
syn keyword r7rsProc reverse-list->f32vector
syn keyword r7rsProc f32vector->vector
syn keyword r7rsProc vector->f32vector
syn keyword r7rsProc make-f32vector-generator
syn keyword r7rsProc f32vector-comparator
syn keyword r7rsProc write-f32vector

" f64 {{{2
syn keyword r7rsProc make-f64vector
syn keyword r7rsProc f64vector
syn keyword r7rsProc f64vector-unfold
syn keyword r7rsProc f64vector-unfold-right
syn keyword r7rsProc f64vector-copy
syn keyword r7rsProc f64vector-reverse-copy
syn keyword r7rsProc f64vector-append
syn keyword r7rsProc f64vector-concatenate
syn keyword r7rsProc f64vector-append-subvectors
syn keyword r7rsProc f64?
syn keyword r7rsProc f64vector?
syn keyword r7rsProc f64vector-empty?
syn keyword r7rsProc f64vector=
syn keyword r7rsProc f64vector-ref
syn keyword r7rsProc f64vector-length
syn keyword r7rsProc f64vector-take
syn keyword r7rsProc f64vector-take-right
syn keyword r7rsProc f64vector-drop
syn keyword r7rsProc f64vector-drop-right
syn keyword r7rsProc f64vector-segment
syn keyword r7rsProc f64vector-fold
syn keyword r7rsProc f64vector-fold-right
syn keyword r7rsProc f64vector-map
syn keyword r7rsProcM f64vector-map!
syn keyword r7rsProc f64vector-for-each
syn keyword r7rsProc f64vector-count
syn keyword r7rsProc f64vector-cumulate
syn keyword r7rsProc f64vector-take-while
syn keyword r7rsProc f64vector-take-while-right
syn keyword r7rsProc f64vector-drop-while
syn keyword r7rsProc f64vector-drop-while-right
syn keyword r7rsProc f64vector-index
syn keyword r7rsProc f64vector-index-right
syn keyword r7rsProc f64vector-skip
syn keyword r7rsProc f64vector-skip-right
syn keyword r7rsProc f64vector-any
syn keyword r7rsProc f64vector-every
syn keyword r7rsProc f64vector-partition
syn keyword r7rsProc f64vector-filter
syn keyword r7rsProc f64vector-remove
syn keyword r7rsProcM f64vector-set!
syn keyword r7rsProcM f64vector-swap!
syn keyword r7rsProcM f64vector-fill!
syn keyword r7rsProcM f64vector-reverse!
syn keyword r7rsProcM f64vector-copy!
syn keyword r7rsProcM f64vector-reverse-copy!
syn keyword r7rsProcM f64vector-unfold!
syn keyword r7rsProcM f64vector-unfold-right!
syn keyword r7rsProc f64vector->list
syn keyword r7rsProc reverse-f64vector->list
syn keyword r7rsProc list->f64vector
syn keyword r7rsProc reverse-list->f64vector
syn keyword r7rsProc f64vector->vector
syn keyword r7rsProc vector->f64vector
syn keyword r7rsProc make-f64vector-generator
syn keyword r7rsProc f64vector-comparator
syn keyword r7rsProc write-f64vector

" c64 {{{2
syn keyword r7rsProc make-c64vector
syn keyword r7rsProc c64vector
syn keyword r7rsProc c64vector-unfold
syn keyword r7rsProc c64vector-unfold-right
syn keyword r7rsProc c64vector-copy
syn keyword r7rsProc c64vector-reverse-copy
syn keyword r7rsProc c64vector-append
syn keyword r7rsProc c64vector-concatenate
syn keyword r7rsProc c64vector-append-subvectors
syn keyword r7rsProc c64?
syn keyword r7rsProc c64vector?
syn keyword r7rsProc c64vector-empty?
syn keyword r7rsProc c64vector=
syn keyword r7rsProc c64vector-ref
syn keyword r7rsProc c64vector-length
syn keyword r7rsProc c64vector-take
syn keyword r7rsProc c64vector-take-right
syn keyword r7rsProc c64vector-drop
syn keyword r7rsProc c64vector-drop-right
syn keyword r7rsProc c64vector-segment
syn keyword r7rsProc c64vector-fold
syn keyword r7rsProc c64vector-fold-right
syn keyword r7rsProc c64vector-map
syn keyword r7rsProcM c64vector-map!
syn keyword r7rsProc c64vector-for-each
syn keyword r7rsProc c64vector-count
syn keyword r7rsProc c64vector-cumulate
syn keyword r7rsProc c64vector-take-while
syn keyword r7rsProc c64vector-take-while-right
syn keyword r7rsProc c64vector-drop-while
syn keyword r7rsProc c64vector-drop-while-right
syn keyword r7rsProc c64vector-index
syn keyword r7rsProc c64vector-index-right
syn keyword r7rsProc c64vector-skip
syn keyword r7rsProc c64vector-skip-right
syn keyword r7rsProc c64vector-any
syn keyword r7rsProc c64vector-every
syn keyword r7rsProc c64vector-partition
syn keyword r7rsProc c64vector-filter
syn keyword r7rsProc c64vector-remove
syn keyword r7rsProcM c64vector-set!
syn keyword r7rsProcM c64vector-swap!
syn keyword r7rsProcM c64vector-fill!
syn keyword r7rsProcM c64vector-reverse!
syn keyword r7rsProcM c64vector-copy!
syn keyword r7rsProcM c64vector-reverse-copy!
syn keyword r7rsProcM c64vector-unfold!
syn keyword r7rsProcM c64vector-unfold-right!
syn keyword r7rsProc c64vector->list
syn keyword r7rsProc reverse-c64vector->list
syn keyword r7rsProc list->c64vector
syn keyword r7rsProc reverse-list->c64vector
syn keyword r7rsProc c64vector->vector
syn keyword r7rsProc vector->c64vector
syn keyword r7rsProc make-c64vector-generator
syn keyword r7rsProc c64vector-comparator
syn keyword r7rsProc write-c64vector

" c128 {{{2
syn keyword r7rsProc make-c128vector
syn keyword r7rsProc c128vector
syn keyword r7rsProc c128vector-unfold
syn keyword r7rsProc c128vector-unfold-right
syn keyword r7rsProc c128vector-copy
syn keyword r7rsProc c128vector-reverse-copy
syn keyword r7rsProc c128vector-append
syn keyword r7rsProc c128vector-concatenate
syn keyword r7rsProc c128vector-append-subvectors
syn keyword r7rsProc c128?
syn keyword r7rsProc c128vector?
syn keyword r7rsProc c128vector-empty?
syn keyword r7rsProc c128vector=
syn keyword r7rsProc c128vector-ref
syn keyword r7rsProc c128vector-length
syn keyword r7rsProc c128vector-take
syn keyword r7rsProc c128vector-take-right
syn keyword r7rsProc c128vector-drop
syn keyword r7rsProc c128vector-drop-right
syn keyword r7rsProc c128vector-segment
syn keyword r7rsProc c128vector-fold
syn keyword r7rsProc c128vector-fold-right
syn keyword r7rsProc c128vector-map
syn keyword r7rsProcM c128vector-map!
syn keyword r7rsProc c128vector-for-each
syn keyword r7rsProc c128vector-count
syn keyword r7rsProc c128vector-cumulate
syn keyword r7rsProc c128vector-take-while
syn keyword r7rsProc c128vector-take-while-right
syn keyword r7rsProc c128vector-drop-while
syn keyword r7rsProc c128vector-drop-while-right
syn keyword r7rsProc c128vector-index
syn keyword r7rsProc c128vector-index-right
syn keyword r7rsProc c128vector-skip
syn keyword r7rsProc c128vector-skip-right
syn keyword r7rsProc c128vector-any
syn keyword r7rsProc c128vector-every
syn keyword r7rsProc c128vector-partition
syn keyword r7rsProc c128vector-filter
syn keyword r7rsProc c128vector-remove
syn keyword r7rsProcM c128vector-set!
syn keyword r7rsProcM c128vector-swap!
syn keyword r7rsProcM c128vector-fill!
syn keyword r7rsProcM c128vector-reverse!
syn keyword r7rsProcM c128vector-copy!
syn keyword r7rsProcM c128vector-reverse-copy!
syn keyword r7rsProcM c128vector-unfold!
syn keyword r7rsProcM c128vector-unfold-right!
syn keyword r7rsProc c128vector->list
syn keyword r7rsProc reverse-c128vector->list
syn keyword r7rsProc list->c128vector
syn keyword r7rsProc reverse-list->c128vector
syn keyword r7rsProc c128vector->vector
syn keyword r7rsProc vector->c128vector
syn keyword r7rsProc make-c128vector-generator
syn keyword r7rsProc c128vector-comparator
syn keyword r7rsProc write-c128vector

" (scheme sort) SRFI-132 {{{1
syn keyword r7rsProc list-sorted? vector-sorted?
syn keyword r7rsProc list-sort list-stable-sort vector-sort vector-stable-sort
syn keyword r7rsProc list-merge vector-merge list-delete-neighbor-dups vector-delete-neighbor-dups
syn keyword r7rsProc vector-find-median 
syn keyword r7rsProcM list-sort! list-stable-sort! vector-sort! vector-stable-sort!
syn keyword r7rsProcM list-merge! vector-merge! list-delete-neighbor-dups! vector-delete-neighbor-dups!
syn keyword r7rsProcM vector-find-median! vector-select! vector-separate!

" }}}

" vim: et sw=2 sts=-1 tw=100 fdm=marker
