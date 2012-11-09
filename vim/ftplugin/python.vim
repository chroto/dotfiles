let python_highlight_all = 1

" PEP 8
set expandtab
set textwidth=79
"set tabstop=8
" should it be 4 or 8?
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

nmap <leader>q :norm oimport pdb; pdb.set_trace()<CR>
