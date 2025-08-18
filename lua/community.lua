-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.lsp.nvim-java" },
  --[[
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-23",
                path = "/usr/lib/jvm/java-23-openjdk/",
              },
            },
          },
        },
        format = {
          enabled = true,
          settings = { -- you can use your preferred format style
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
    },
  },
--]]
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    --  config = function() vim.cmd "colorscheme miasma" end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function() require("copilot_cmp").setup() end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end,
    },
  },
}
