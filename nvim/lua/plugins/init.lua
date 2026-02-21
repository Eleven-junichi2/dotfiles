-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
 {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        transparent_bg = true,
    },
    config = function()
      vim.cmd.colorscheme 'dracula'
    end
  },
  {
    'nmac427/guess-indent.nvim',
    opts = {}
  },
  {
    "folke/which-key.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },
}