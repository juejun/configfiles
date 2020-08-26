
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim', {'as': 'dracula'}

call plug#end()

colorscheme dracula

set nu
set cul
set cmdheight=1
set history=1000

set hlsearch
set incsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set iskeyword+=_,$,@,&,#,-
"set ignorecase
"set smartcase
set fillchars=vert:\ ,stl:\ ,stlnc:\

"set nowrap
set noswapfile
set wildmenu
set scrolloff=3
highligh Normal ctermbg=NONE ctermfg=NONE

syntax on
filetype on
filetype plugin on
filetype plugin indent on

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd FileType python highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
autocmd FileType python match OverLength /\%79v.\+/
autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e

autocmd BufNewFile *.py exec ':call SetTitle()'
func SetTitle()
    if &filetype == 'python'
        call setline(1, '#!/usr/bin/python')
        call append(line('.'), '# -*- coding: utf-8 -*-')
        call append(line('.')+1, '')
    endif
endfunc
autocmd BufNewFile * normal G

