" Settings
" - Base
set showcmd
set hidden
set noswapfile
set nobackup
set fenc=utf-8
set encoding=UTF-8
set autoread
set number
set wrap
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" set showmode
set tabstop=4
set shiftwidth=4
set cmdheight=2
set cursorline
nnoremap ; :
nnoremap j gj
nnoremap k gk
let mapleader = ","

" - Log
"set verbosefile=/tmp/vim.log
"set verbose=20

" - Color
autocmd ColorScheme * highlight Comment ctermfg=darkgray
hi Comment ctermfg=darkgray
hi LineNr ctermfg=250 ctermbg=23
hi CursorLineNr ctermfg=darkgray ctermbg=43
hi clear CursorLine
hi TermCursor ctermfg=white ctermbg=43
hi Pmenu ctermfg=white ctermbg=63
hi PmenuSel ctermfg=white ctermbg=gray
hi NonText ctermfg=darkgray
hi Statement ctermfg=180
hi MatchParen ctermfg=43 ctermbg=darkgray
" hi Normal ctermbg=
hi NormalNC ctermfg=248 ctermbg=232

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
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap { {}<left>
inoremap ( ()<left>

" - TerminalMode
tnoremap <Esc> <C-\><C-n>

" Providers
let g:python3_host_prog = '/usr/local/bin/python3'
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kishimotoyuuichi/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

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

"End dein Scripts-------------------------
