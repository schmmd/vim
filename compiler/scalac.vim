" Compiler: scala compiler (scalac)
" Author: Michael Schmitz <michael@schmitztech.com>
" Last Change: 10/27/2011

if exists("current_compiler")
    finish
endif
let current_compiler = "scalac"

set makeprg=scalac\ %
set errorformat=%E%f:%l:\ error:\ %m,%Z%p^,%-C%.%#,
    \%-G%.%#