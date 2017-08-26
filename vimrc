""PSF
" load archlinux.vim
runtime! archlinux.vim
set nocompatible              " be iMproved, required

" number on the side
set number
set relativenumber

" syntax highlight
syntax enable

" mouse for (a=all) modes
set mouse=a

" source vim-plug for plugins
source ~/.dotfiles/vim-plugins

" My mappings
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" My commands
command! SrcVrc source ~/.vimrc
