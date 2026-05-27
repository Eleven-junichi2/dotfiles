return {
  {
    -- Run `:checkhealth vim.lsp` to check the current LSP status.
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
	-- --Configure to recognize `vim` global.--
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
	-- ----
      })

      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "ruff",
        "clangd",
	"neocmake",
      })
    end,
  },
}
