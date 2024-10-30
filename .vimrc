"Davi Ferreira Puddo

syntax on

set number
set relativenumber
set mouse=a
set wrap

"Tab
set tabstop=4
set shiftwidth=4

set autoindent
set smartindent

"Util
inoremap jk <esc>

"Shift
nnoremap <M-Up> ddkkp 
nnoremap <M-Down> ddp 

"Java
autocmd FileType java iabbrev <buffer> boiler public class x<esc>o{<CR>public static void main(String[] args)<esc>o{<tab><CR><esc>o}<esc>o}<esc>kkkkkk<esc>wwi<BS>
autocmd FileType java iabbrev <buffer> SYSO System.out.println ();

"Status line
set laststatus=2
set statusline=\ %f\ -\ %y\ %m
set statusline+=%=
set statusline+=%6l/%-4L\ \ %P\ \ 

"Save file
nnoremap <C-q> :w<CR>

"Open terminal
nnoremap <C-t> :vs a<CR>:terminal<CR><C-w><C-w>:q<CR>
nnoremap <S-t> :terminal<CR>
