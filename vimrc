call pathogen#infect()

" Highlighting
syntax on
colorscheme inkpot
set cursorline
hi CursorLine cterm=NONE ctermbg=238
match ErrorMsg '\%>80v.\+'

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
imap [25~ :tabprev
nmap [26~ :tabnext
imap [26~ :tabnext

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
