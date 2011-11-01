" Compiler: scala interpreter (scalai)
" Author: Michael Schmitz <michael@schmitztech.com>
" Last Change: 10/27/2011

if exists("current_compiler")
    finish
endif
let current_compiler = "scalai"

set makeprg=scala\ %
set errorformat=%E%f:%l:\ error:\ %m,%Z%p^,%-C%.%#,
    \%-G%.%#