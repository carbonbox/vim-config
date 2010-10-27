" Use Vim!
set nocompatible

" Set the encoding to utf-8
set encoding=utf-8

" Set guioptions
set guioptions=et

" Colors
color carbonbox
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Show tabs and trailing spaces
set list
set listchars=tab:▸\ ,trail:·

" Use 4 spaces and not tabs
" and autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

set incsearch
set ignorecase
set smartcase
set scrolloff=3
set wildmode=longest,list


set ruler

set hlsearch
syntax on                       " syntax highlighting


" Runs a command, preserving the cursor position
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction


" Set file type specific options
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif
