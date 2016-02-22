set nocompatible

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

set backspace=indent,eol,start

set enc=utf-8

set history=500

set laststatus=2

filetype plugin indent on

set autoindent
set smartindent
set nowrap
set showmatch

set ruler

"设置语法高亮
syntax enable
syntax on

"高亮显示匹配的括号
set showmatch

"设置行号
set nu

"TAB宽4个空格
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set paste

