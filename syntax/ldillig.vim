" Remove old stuff (borrowed from haskell.vim)
if version < 600
    syn clear
elseif exists("b:current_syntax")
    finish
endif

" Identifiers and basic syntax elements
syn match ldilligId "\<[a-zA-Z][a-zA-Z_0-9]*\>"
syn match ldilligInt "\<[0-9]\+\>"
syn region ldilligString start=+"+ end=+"+

syn match ldilligOperator "[-#!@*/+&|=<>]\|\(<\)>\|<=\|>="

" All keywords
syn keyword ldilligStatement let in fun with lambda
syn keyword ldilligConditional if then else
syn keyword ldilligIo print readInt readString
syn keyword ldilligTest isNil
syn keyword ldilligSpecial Nil

" Function
syn match ldilligFunction "\%(\%(fun\)\s*\)\@<=\%(\h[a-zA-Z][a-zA-Z_0-9]*\|[a-zA-Z]\)"

" Nested comments
syn region ldilligComment start="(\*" end="\*)" contains=ldilligComment

" Highlight
if version >= 508 || !exists("did_ldillig_syntax_inits")
    if version < 508
        let did_ldillig_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink ldilligInt Number
    HiLink ldilligString String
    HiLink ldilligOperator Operator
    HiLink ldilligStatement Statement
    HiLink ldilligConditional Conditional
    HiLink ldilligIo Function
    HiLink ldilligTest Function
    HiLink ldilligSpecial Boolean
    HiLink ldilligFunction Function
    HiLink ldilligComment Comment

    delcommand HiLink
endif

let b:current_syntax = "ldillig"
