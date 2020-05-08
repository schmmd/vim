"
" Maintainer: Michael Schmitz
"
"

" Allow backspace to move up a line
set backspace=indent,eol,start

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

" maintain backup files and temp files in ~/.vimfiles
" instead of cluttering the current directory.
set backup
set undofile
set backupdir=$HOME/.vimfiles/backup " location for backup
set undodir=$HOME/.vimfiles/undo " location for persistant undos
set directory=$HOME/.vimfiles/temp,tmp " location for swap

" indent/format entire file, retaining cursor position
" http://stackoverflow.com/q/7933015/568393
nnoremap <LEADER>i mmgg=G'm^
nnoremap <LEADER>f mmgggqG'm^

" remove trailing spaces
nnoremap <silent> <LEADER>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" filetype settings
filetype indent on
filetype plugin on

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
