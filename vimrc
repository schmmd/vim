" 
" Maintainer: Michael Schmitz
"
"

call pathogen#infect()

" disable old vi options in favor of vim options
set nocompatible 

set autoindent
set expandtab
set shiftwidth=4
set tabstop=4

syntax on " enable syntax highlighting
set history=50 " keep 50 lines of command line history 
set ruler " show the cursor position all the time 
set showcmd " display incomplete commands in the lower-right
set incsearch " do incremental searching 
set nohlsearch " don't highlight search matches
set noerrorbells
set vb t_vb= " disable visual bell
set wildmenu " allow tab completion
set wildignore=*.class,*.o

set nospell " disable spell checking

" maintain backup files and temp files in ~/.vimfiles
" instead of cluttering the current directory.
set backup
set undofile
set backupdir=$HOME/.vimfiles/backup " location for backup
set undodir=$HOME/.vimfiles/undo " location for persistant undos
set directory=$HOME/.vimfiles/temp,tmp " location for swap

" regenerate ctags
nnoremap <LEADER>g :w<CR>:!sh -xc 'ctags -R'<CR>
" set ctags folders
set tags=./tags,tags

" indent/format entire file, retaining cursor position
" http://stackoverflow.com/q/7933015/568393
nnoremap <LEADER>i mmgg=G'm^
nnoremap <LEADER>f mmgggqG'm^

" scala mappings
augroup scala 
  au FileType scala compiler scalai
  au FileType scala set tabstop=2
  au FileType scala set shiftwidth=2
augroup END

" maven mappings
fun! IfPomXmlExists()
  if file_readable("pom.xml")
    compiler maven
    " create a package
    " useful because it will also run the test suite--unlike :make
    nnoremap <LEADER>p :w<CR>:!sh -xc 'mvn package'<CR>
    " download all dependency sources
    " useful for generating ctags over dependencies
    nnoremap <LEADER>d :w<CR>:!sh -xc 'mvn dependency:unpack-dependencies -Dclassifier=sources -Dmdep.failOnMissingClassifierArtifact=false'<CR>
  endif
endfun
augroup pomxml
  au!
  au BufRead * call IfPomXmlExists()
augroup END

" use scalariform to format scala code
au BufEnter *.scala setl formatprg=java\ -jar\ $HOME/.vim/scala/scalariform.jar\ --stdin\ --forceOutput

" indent/format xml file
autocmd FileType xml set equalprg=xmllint\ --format\ -
autocmd FileType xml set formatprg=xmllint\ --format\ -

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" always add the current file's directory to the path if not already there
autocmd BufRead *
  \ let s:tempPath=escape(escape(expand("%:p:h"), ', '), ',\ ') . "**" |
  \ exec "set path-=".s:tempPath |
  \ exec "set path+=".s:tempPath
