""PSF
" load archlinux.vim
runtime! archlinux.vim
set nocompatible              " be iMproved, required

" number on the side
set number
set relativenumber
set so=10
filetype plugin on

" syntax highlight
syntax enable

" mouse for (a=all) modes
set mouse=a

" source vim-plug for plugins
source ~/.dotfiles/vim-plugins

" My mappings
nmap <Enter> O<ESC>j
nmap <Backspace> i<Backspace><ESC>



" My commands
command! SrcVrc source ~/.vimrc


"""From github.com/LukeSmithxyz

vnoremap <C-c> "*y
"nnoremap <C-t> :tabnew<cr>

"""BASIC TOOLS
"Navigating with guides
"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"map <Space><Space> <Esc>/<++><Enter>"_c4l
"inoremap ;gui <++>

"For split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

