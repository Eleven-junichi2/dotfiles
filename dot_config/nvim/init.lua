-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "

-- OPTIONS
--
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

vim.o.number = true -- Show line numbers in a column.

-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    vim.o.clipboard = "unnamedplus"
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 3 -- Keep this many screen lines above/below the cursor.
vim.o.list = true -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true

-- display diagnostic
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})


-- Indent / Tab Settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.smartindent = true

-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")

-- Map <D-/> `Command + /` to toggle comment line or selection
vim.keymap.set({ "n" }, "<D-/>", "gcc", { remap = true, desc = "Toggle comment line" })
vim.keymap.set({ "v" }, "<D-/>", "gc", { remap = true, desc = "Toggle comment selection" })

-- Map for diagnostic

vim.keymap.set("n", "<leader>d", function()
  -- 1回目：まずポップアップを開く（すでに開いている場合はそのウィンドウIDが返る）
  local _, winid = vim.diagnostic.open_float({ focus = false })
  -- 2回目：開いたウィンドウが存在する場合、そこに確実にフォーカスを移動する
  if winid then
    vim.api.nvim_set_current_win(winid)
  end
end, { desc = "Show diagnostic and force focus" })

-- --Map for file explorer--
-- Neo-tree.nvim
vim.keymap.set("n", "<leader>E", function()
  require("neo-tree.command").execute({
    action = "focus", -- neo-tree を開いてフォーカスする
    source = "filesystem", -- ファイルツリーを表示する
    position = "left", -- 左サイドバーに出す
    reveal = true, -- 現在開いているファイルの場所を表示する
    toggle = true,
  })
end, { desc = "Toggle file explorer (Neo-tree)" })
-- Oil.nvim
vim.keymap.set("n", "<leader>e", function()
  require("oil").toggle_float()
end, { desc = "Toggle file explorer (Oil.nvim)" })
-- ----

-- Map for buffer
vim.keymap.set("n", "<leader><Tab>", vim.cmd.bnext, { desc = "Next buffer (tab)" })
vim.keymap.set("n", "<leader><S-Tab>", vim.cmd.bprevious, { desc = "Previous buffer (tab)" })

local do_format = function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end
vim.keymap.set({ "n", "v" }, "<leader>f", do_format, { desc = "Format buffer" })

-- Map for display documentation

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command("GitBlameLine", function()
  local line_number = vim.fn.line(".") -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ "git", "blame", "-L", line_number .. ",+1", filename }):wait().stdout)
end, { desc = "Print the git blame for the current line" })

-- PLUGINS

-- --Use lazy.nvim as the plugin manager--
require("config.lazy")
-- ----

-- --Use vim.pack as the plugin manager--

-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
-- vim.cmd('packadd! nohlsearch')
--
-- -- Install third-party plugins via "vim.pack.add()".
-- vim.pack.add({y
--     -- Quickstart configs for LSP
--     'https://github.com/neovim/nvim-lspconfig',
--     -- Fuzzy picker
--     'https://github.com/ibhagwan/fzf-lua',
--     -- Autocompletion
--     'https://github.com/nvim-mini/mini.completion',
--     -- Enhanced quickfix/loclist
--     'https://github.com/stevearc/quicker.nvim',
--     -- Git integration
--     'https://github.com/lewis6991/gitsigns.nvim',
-- })
--
-- require('fzf-lua').setup { fzf_colors = true }
-- require('mini.completion').setup {}
-- require('quicker').setup {}
-- require('gitsigns').setup {}
-- ----

-- --Apperance/Colorscheme--
vim.cmd.colorscheme("dracula")

-- bg = "NONE"で透過設定
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
--
