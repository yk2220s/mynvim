" Settings
" - Lang
let $LANG='en_US.UTF-8'

" - Base
set autoread
set cmdheight=2
set cursorline
set clipboard=unnamed
set encoding=UTF-8
set fenc=utf-8
set hidden
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set noswapfile
set nobackup
set number
set pumblend=10
set shiftwidth=4
set showcmd
set signcolumn=yes
set smartindent
" set showmode
set tabstop=4
set wrap
let mapleader = ","

" - Log
" set verbosefile=/tmp/vim.log
" set verbose=20

" - Color
set termguicolors
" autocmd ColorScheme * highlight Comment ctermfg=darkgray
" hi Comment ctermfg=darkgray
" hi LineNr ctermfg=250 ctermbg=23
" hi Cursor guifg=#2E3440
" hi CursorLineNr ctermfg=darkgray ctermbg=43
" hi clear CursorLine
" hi TermCursor ctermfg=white ctermbg=43
" hi Pmenu ctermfg=white ctermbg=63
" hi PmenuSel ctermfg=white ctermbg=gray
" hi NonText ctermfg=darkgray
" hi Statement ctermfg=180
" hi MatchParen ctermfg=43 ctermbg=darkgray guibg=
" hi Normal ctermbg=
" autocmd ColorScheme * hi NormalNC ctermfg=248 ctermbg=232 guibg=#2E3440
" autocmd ColorScheme * hi Normal ctermfg=248 ctermbg=232 guibg=#1A202C

" - Window
set splitbelow
set splitright
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sp :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap s- <C-w>-
nnoremap s+ <C-w>+
nnoremap s. <C-w>>
nnoremap s, <C-w><

" - Tab
nnoremap tn :<C-u>tabnew<CR>
nnoremap tl gt
nnoremap th gT

" - NormalMode
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap d "_d

" - InsertMode
inoremap <C-c> <Esc>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-f> <right>
inoremap <C-d> <BS>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <UP> <C-c>gka
inoremap <DOWN> <C-c>gja
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap {<CR> {<CR>}<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap (<cr> (<CR>)<C-o>O

" - VisualMode
vnoremap d "_d
vnoremap j gj
vnoremap k gk

" - TerminalMode
tnoremap <Esc> <C-\><C-n>

" Providers
let g:python3_host_prog = '/usr/local/bin/python3'
let g:node_host_prog = '/usr/local/opt/nvm/versions/node/v15.13.0/bin/neovim-node-host'
let g:ruby_host_prog = '$HOME/.rbenv/shims/neovim-ruby-host'

" Dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  let g:dein#auto_recache = 1

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------
