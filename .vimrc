" =================================================
" VUNDLE
" =================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails'

call vundle#end()

" =================================================
" END VUNDLE
" =================================================

syntax on
filetype on
filetype indent on
filetype plugin on

let mapleader = " "
" set clipboard=unnamed
colorscheme slate
set backspace=2
set autowrite

" no bloody beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" keeps buffers in memory when not in view, preserves history, marks etc.
set hidden

" Highlight 80th column and beyond column 120
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Use one space, not two, after punctuation.
set nojoinspaces

" Show line numbers
set nu
set rnu

" macro to add frozen string literal comment to top of ruby files
let @f = 'ggO# frozen_string_literal: true'

" arrows for buffer  nav
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

set history=50  " Number of things to remember in history.
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.dotfiles/vim/backups " Where backups will go.
set directory=~/.dotfiles/vim/tmp     " Where temporary files will go.

" Auto trim whitespace on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" ruby path if you are using rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')

map <leader>w :w<cr>
map <leader>fs :w<cr>
map <leader>q :q<cr>
map <leader>qq :q<cr>
map <leader>bd :bd<cr>

" RSpec.vim mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" send rspec commands to tmux
" let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" Airline display buffers
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
" ==============================================================
"                    NERDCOMMENTER
" ==============================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" ==============================================================
"                    SILVER SEARCHER
" ==============================================================

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" ==============================================================
"                    AUTO COMPLETE RUBY
" ==============================================================

" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
