call pathogen#infect()

" Highlighting
syntax on
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
" hi Normal ctermfg=231 ctermbg=NONE
hi CursorLine cterm=NONE ctermbg=238
set cursorline

match ErrorMsg '\%>80v.\+'

autocmd FileType gitcommit setlocal spell

" Search
set hlsearch
set incsearch

" Indent
filetype plugin indent on
set autoindent smartindent cindent
set expandtab shiftwidth=2 tabstop=2

" Keys
set backspace=indent,eol,start
nmap [25~ :tabprev
imap [25~ <Esc>:tabprev
nmap [26~ :tabnext
imap [26~ <Esc>:tabnext

" Statusline
set laststatus=2
set statusline=%w%h%{fugitive#statusline()}\ %f\ %q%m%r%=%y\ <%02B>\ %3l,%2c\ \ %P

" Code cleanup
function! StripTrailingSpaces()
  let v = winsaveview()
  silent! %s/\s\+$//e
  call histdel('/', -1)
  call winrestview(v)
endfunction
autocmd FileType ruby,eruby,haml,html,javascript,css,scss
    \ autocmd BufWritePre <buffer> call StripTrailingSpaces()

" Misc
set autoread
set dir=~/.vim/tmp//
set encoding=utf-8
set wildmenu wildmode=list:longest
let g:explDetailedHelp=0

" Stupid
cabbrev W w
cabbrev Wq wq

" Bracketed paste mode
let &t_ti = &t_ti . "\e[?2004h"
let &t_te = "\e[?2004l" . &t_te
function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
endfunction
map <expr> <Esc>[200~ XTermPasteBegin("i")
imap <expr> <Esc>[200~ XTermPasteBegin("")
cmap <Esc>[200~ <nop>
cmap <Esc>[201~ <nop>
