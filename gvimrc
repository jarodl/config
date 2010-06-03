" -----------------------------------------------------------
"  GRAPHICAL
" -----------------------------------------------------------
"
winpos 0 0
colorscheme twilight

set gfn=DejaVu\ Sans\ Mono:h12
set anti               			" antialiasing
set guioptions=gemc
set columns=80
set lines=60                    " perfect for 1440x900
set cursorline                  " show the current line by highlighting it
set ch=4

set clipboard+=unnamed			" put the * register on the system clipboard

" fullscreen mode
":set fuoptions=maxvert,maxhorz

" -----------------------------------------------------------
"  Highlight Trailing Whitespace
" -----------------------------------------------------------
"
highlight SpecialKey    guifg=#222222 guibg=#000000
highlight StatusLineNC  guifg=#444444 guibg=#222222
highlight StatusLine    guifg=#AAAACC guibg=#222222

" C-# switches to tab
nmap <d-1> 1gt
nmap <d-2> 2gt
nmap <d-3> 3gt
nmap <d-4> 4gt
nmap <d-5> 5gt
nmap <d-6> 6gt
nmap <d-7> 7gt
nmap <d-8> 8gt
nmap <d-9> 9gt

" C-TAB and C-SHIFT-TAB cycle tabs forward and backward
nmap <c-tab> :tabnext<cr>
imap <c-tab> <c-o>:tabnext<cr>
vmap <c-tab> <c-o>:tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>
imap <c-s-tab> <c-o>:tabprevious<cr>
vmap <c-s-tab> <c-o>:tabprevious<cr>
