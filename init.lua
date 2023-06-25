-- Base
vim.scriptencoding = "utf-8"
vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.autoread = true
vim.opt.cmdheight = 2
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.list = true
vim.opt.listchars = {tab='»-', trail='-', eol='↲', extends='»', precedes='«', nbsp='%'}
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.shiftwidth= 4
vim.opt.tabstop = 4
vim.opt.showcmd = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.showmode = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = false
vim.opt.laststatus = 3
vim.opt.completeopt = 'menuone,noselect'

vim.cmd([[colorscheme habamax]])

-- Keymap
local opts = { noremap = true, silent = true }

---- Normal
vim.api.nvim_set_keymap("n", ";", ":", opts)
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)
vim.api.nvim_set_keymap("n", "d", '"_d', opts)
vim.api.nvim_set_keymap("n", "x", '"_x', opts)

---- Normal - Window
vim.api.nvim_set_keymap("n", "s", "<Nop>", opts)
vim.api.nvim_set_keymap("n", "sj", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "sk", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "sl", "<C-w>l", opts)
vim.api.nvim_set_keymap("n", "sh", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "sJ", "<C-w>J", opts)
vim.api.nvim_set_keymap("n", "sK", "<C-w>K", opts)
vim.api.nvim_set_keymap("n", "sL", "<C-w>L", opts)
vim.api.nvim_set_keymap("n", "sH", "<C-w>H", opts)
vim.api.nvim_set_keymap("n", "sp", ":<C-u>sp<CR>", opts)
vim.api.nvim_set_keymap("n", "sv", ":<C-u>vs<CR>", opts)
vim.api.nvim_set_keymap("n", "s-", "<C-w>-", opts)
vim.api.nvim_set_keymap("n", "s+", "<C-w>+", opts)
vim.api.nvim_set_keymap("n", "s.", "<C-w>>", opts)
vim.api.nvim_set_keymap("n", "s,", "<C-w><", opts)

---- Normal - Tab
vim.api.nvim_set_keymap("n", "tn", ":<C-u>tabnew<CR>", opts)
vim.api.nvim_set_keymap("n", "tl", "gt", opts)
vim.api.nvim_set_keymap("n", "th", "gT", opts)

---- Normal - Diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

---- Insert
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", opts)
vim.api.nvim_set_keymap("i", "<C-j>", "<down>", opts)
vim.api.nvim_set_keymap("i", "<C-k>", "<up>", opts)
vim.api.nvim_set_keymap("i", "<C-h>", "<left>", opts)
vim.api.nvim_set_keymap("i", "<C-l>", "<right>", opts)
vim.api.nvim_set_keymap("i", "<C-f>", "<right>", opts)
vim.api.nvim_set_keymap("i", "<C-d>", "<BS>", opts)
vim.api.nvim_set_keymap("i", "<C-a>", "<C-o>^", opts)
vim.api.nvim_set_keymap("i", "<C-e>", "<C-o>$", opts)
vim.api.nvim_set_keymap("i", "<UP>", "<C-c>gka", opts)
vim.api.nvim_set_keymap("i", "<DOWN>", "<C-c>gja", opts)
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<C-o>O", opts)
vim.api.nvim_set_keymap("i", "[<CR>", "[<CR>]<C-o>O", opts)
vim.api.nvim_set_keymap("i", "(<cr>", "(<CR>)<C-o>O", opts)

---- Visual
vim.api.nvim_set_keymap("v", "d", '"_d', opts)
vim.api.nvim_set_keymap("v", "j", "gj", opts)
vim.api.nvim_set_keymap("v", "k", "gk", opts)

---- Terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- lazy.nvim
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
