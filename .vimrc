set nocompatible

" =================================================
" PLUG
" =================================================

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'jremmen/vim-ripgrep'

Plug 'mg979/vim-visual-multi'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'jlanzarotta/bufexplorer'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'

" auto close ({[ etc.
Plug 'Townk/vim-autoclose'
" auto close x/html tags
Plug 'alvan/vim-closetag'

" The Tim Pope collection
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Language/templating/framework plugins
Plug 'elixir-editors/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'

call plug#end()

" =================================================
" END PLUG
" =================================================

" =================================================
" VIM AIRLINE
" =================================================

let g:airline_powerline_fonts = 1

" TODO remove this?
" disable the tabline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" -------------------------------------------------
syntax on
filetype on
filetype indent on
filetype plugin on

let mapleader = " "
set clipboard=unnamedplus
colorscheme slate
set backspace=2
set autowrite
set splitright

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
setlocal list listchars=tab:»·,trail:·,nbsp:·


" Use one space, not two, after punctuation.
set nojoinspaces

" Show line numbers
set nu
set rnu


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

" Disable comments automatically continuing on next line if press return
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


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
"                    RIPGREP
" ==============================================================

" bind K to grep word under cursor
nnoremap K :Rg <C-R><C-W><CR>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Rg<SPACE>


" ==============================================================
"                          NETRW
" ==============================================================

" Hide banner, uncomment this once used to commands?
" let g:netrw_banner = 0


" ==============================================================
"                          ALE
" ==============================================================
highlight ALEWarning ctermbg=Black

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['prettier'],
\   'markdown': ['write-good'],
\   'erb': ['erb']
\}

" phoenix code reloading doesn't work without this
let g:ale_linters = {
\   'elixir': ['mix']
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file


" ==============================================================
"                          FUGITIVE
" ==============================================================
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
" nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gc :Dispatch git commit<CR>
" nnoremap <space>gt :Gcommit -v -q %:p<CR>
" nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
" nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

let g:fugitive_bitbucket_domains = ['bitbucket.thefloow.com']

" ==============================================================
"                          RUBY SPECIFIC SETTINGS
" ==============================================================

" ruby path if you are using rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')

" Auto complete Ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

let test#strategy = "neovim"
" let test#ruby#minitest#file_pattern = '_spec\.rb' " the default is '_test\.rb'

" macro to add frozen string literal comment to top of ruby files
let @f = 'ggO# frozen_string_literal: true'

let g:rails_projections = {
      \ "app/lib/*.rb": {
      \   "test": [
      \     "test/lib/{}_test.rb",
      \     "spec/lib/{}_spec.rb"
      \   ]
      \ }
      \}

let g:projectionist_heuristics = {
      \ "*": {
      \  "apps/*.rb": {
      \    "alternate": "spec/{}_spec.rb",
      \    "type": "source"
      \  },
      \  "spec/*_spec.rb": {
      \    "alternate": "apps/{}.rb",
      \    "type": "test"
      \  }
      \ }
      \}


" ==============================================================
"                          VIM SNIPPETS SETTINGS
" ==============================================================

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/"
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips/", "UltiSnips"]

" ==============================================================
"                     EMMET SETTINGS
" ==============================================================

let g:user_emmet_leader_key='<c-m>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,eruby EmmetInstall
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \      'extends' : 'jsx',
  \  },
  \}

" ==============================================================
"                     JAVASCRIPT SETTINGS
" ==============================================================

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" ==============================================================
"                     EDITORCONFIG SETTINGS
" ==============================================================

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" ==============================================================
"                     ELM SETTINGS
" ==============================================================

 let g:elm_setup_keybindings = 0


" ==============================================================
"                     GUTENTAGS SETTINGS
" ==============================================================
 let g:gutentags_define_advanced_commands = 1


" ==============================================================
"                     LEADER/MAPPINGS
" ==============================================================

map <leader>r :ALEFix<cr>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>bd :bd<cr>
map <leader>b :bu<space>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>f :Files<cr>
map <leader>e :Explore<cr>
nnoremap <leader>t :w<cr>:TestFile<cr>
nnoremap <leader>s :w<cr>:TestNearest<cr>
nnoremap <leader>a :w<cr>:TestSuite<cr>
nnoremap <leader>l :w<cr>:TestLast<cr>
nnoremap <leader>v :w<cr>:TestVisit<cr>

" arrows for buffer  nav
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>
nnoremap <C-p> :Files<cr>

" gd to go to tag definition
:nnoremap gd <C-]>
