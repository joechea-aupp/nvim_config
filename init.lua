vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim'}
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>og', builtin.treesitter, {})

-- ----------------------------------------------------------------------------------
-- before the above fix can process, make sure to install gcc, install using mingw.
-- fix treesitter could not compile in windows.
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1985#:~:text=and%20its%20quite%20easy.%20Have%20a%20good%20day%20%F0%9F%99%8F-,Worked%20perfectly%20for%20me%20on%20Windows!!!%20Thank%20you,-The%20only%20change%20I%20did%20was%3A%0Arequire
-- make sure to install scoop and then zig.
require("nvim-treesitter.install").compilers = {"zig"}
-- ----------------------------------------------------------------------------------

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua","php", "javascript"},
  highlight = {enable = true},
  indent = {enable = true},
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
