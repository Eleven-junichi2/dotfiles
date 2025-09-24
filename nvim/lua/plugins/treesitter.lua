return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup(
      {
        ensure_installed = {
          'python', 'bash', 'c',
          'diff', 'html', 'lua',
          'luadoc', 'markdown', 'markdown_inline',
          'query', 'vim', 'vimdoc',
        },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
  end
}
