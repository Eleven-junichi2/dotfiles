return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- run `:help conform-formatters` to view the list of formatter names
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        lua = { "stylua" },
        rust = { "rustfmt" },
      },
    },
  },
}
