""PSF
" load archlinux.vim
runtime! archlinux.vim
set nocompatible              " be iMproved, required

" number on the side
set number
set relativenumber

set so=10
set foldmethod=marker
filetype plugin on
colorscheme desert

" syntax highlight
syntax enable

" mouse for (a=all) modes
set mouse=a

" source vim-plug for plugins
source ~/.config/vim/vim-plugins

" Some from github.com/LukeSmithxyz
" My mappings
map <Enter> O<ESC>j
"nmap <Backspace> ki<Del><Esc>


vnoremap <C-c> "+y
nnoremap <C-t> :tabnew<cr>

"For split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" My commands
command! SrcVrc source ~/.vimrc




