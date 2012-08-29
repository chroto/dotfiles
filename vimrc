"""""""
" vimrc file
"

"" Pathogen for easy adding
"" to runtime environment
filetype off
call pathogen#infect()
filetype plugin indent on
syntax on

set t_Co=256

"" set leader to easier key
let mapleader=","

"" Some basic stuff to make
"" vim less vi-like
set bs=2
set shm=atI
set nocompatible

"" locale
set encoding=utf-8

"" theming
set number
set ruler
set lsp=10
colors zenburn|+

"" status information
set showmode
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)\
set showcmd
set title

"" set wrapping to 80 chars
set breakat=80
set linebreak

"" Keep 50 lines of command history
set history=50

"" spice up searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" use markers to set folding
set foldmethod=marker

"" turn mouse on
set mouse=a

"" Wildmenu completions
set wildmenu
set wildmode=list:longest
set wildignore=node_modules,*.old,*.swo,*.swp,*.pyc

"" whitespace characters
set listchars=eol:$,trail:+,extends:>,precedes:<

"" Command-T options
let g:CommandTMaxFiles=30000

set scrolloff=5

"" LatexBox options
let g:LatexBox_latexmk_options = "-pvc -pdfps"

"" backup dirs
set backupdir=~/.vim-tmp,/tmp
set directory=~/.vim-tmp,/tmp

"" smarter tabs
set expandtab
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

""""""
" Aliases
"
" Center screen
nmap <Space> zz

" Saving
:command Wq wq
:command WQ wq
:command Wqall wqall
:command W w
:command Q q

"" save as sudo
:command Wsudo w !sudo tee %

""""""
" Keybindings
"

"" DATE (cool!)
nmap <leader>d :r !date<CR>

"" toggle whitespace chars
nmap <silent> <leader>s :set nolist!<CR>

" Tab indents
imap <S-Tab> <ESC>v<<<ESC>i
vmap <Tab> >gv
vmap <S-Tab> <gv

"" clear search
nmap <F3> :noh<RETURN>

"" X11 clipboard (Shift-Insert)
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
map <Leader>a :Ack


"" markers
nnoremap ' `
nnoremap ` '

"" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

"" Bubble multiple lines
vmap <C-up> xkP`[V`]
vmap <C-down> xp`[V`]

"" faster scroll
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

"" strip trailing whitespace
map gw :g/\s\+$//
"" rotate 2 items along a comma
map g, :s/\([^()]*\),\([^()]*\)/\2,\1/<Enter>

"" paste from system clipboard
map gp "*p
map gP "*P
map gy "*y

map g; :s/\v^(.+)$/\1;/<CR>:noh<CR>

"" open scratch
nmap <C-s> :Sscratch

"" word 'push'
:nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
:nnoremap <silent> gl "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>


"" Syntax
let g:syntastic_check_on_open = 1
let g:syntastic_python_checker = "flake8"
let g:syntastic_haskell_checker = "hlint"
" Ignore line too long pep errors
let g:syntastic_python_checker_args = "--ignore=E501"
let g:syntastic_javascript_checker = "jshint"
" Load options for jshint which include linting of some common
" js anti-patterns.  There are more options you can read about
" at jshint.com.
let g:syntastic_javascript_jshint_conf = $HOME."/.vim/syntax/jshint.json"

let b:shell = " "

:set fileformat=unix

nmap <Leader>e :CommandTTag<CR>
