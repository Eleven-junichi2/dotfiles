-- Leader Keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- Line Numbers
vim.o.number = true
-- vim.o.relativenumber = true

-- Mouse Support
vim.o.mouse = 'a'

-- UI
vim.o.showmode = false
vim.o.cursorline = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.signcolumn = 'yes'

-- Clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Indentation
vim.o.breakindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'

-- Window & Behavior
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.scrolloff = 10
vim.o.confirm = true

-- Performance & Timing
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Plugin Manager
require("config.lazy")