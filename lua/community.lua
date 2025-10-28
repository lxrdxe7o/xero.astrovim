-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.lua" },

  -- { import = "astrocommunity.pack.java" },
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
                name = "JavaSE-21",
                path = "/usr/lib/jvm/java-21-openjdk/",
              },
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk/",
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
  ]]
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
    --[[
require("cyberdream").setup {
  -- Set light or dark variant
  variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

  -- Enable transparent background
  transparent = true,

  -- Reduce the overall saturation of colours for a more muted look
  saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

  -- Enable italics comments
  italic_comments = true,

  -- Replace all fillchars with ' ' for the ultimate clean look
  hide_fillchars = false,

  -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
  borderless_pickers = true,

  -- Set terminal colors used in `:terminal`
  terminal_colors = true,

  -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
  cache = true,

  extensions = {
    alpha = true,
    blinkcmp = true,
    cmp = true,
    dashboard = true,
    fzflua = true,
    gitpad = true,
    gitsigns = true,
    grapple = true,
    grugfar = true,
    heirline = true,
    helpview = true,
    hop = true,
    indentblankline = true,
    kubectl = true,
    lazy = true,
    leap = true,
    markdown = true,
    markview = true,
    mini = true,
    noice = true,
    neogit = true,
    notify = true,
    rainbow_delimiters = true,
    snacks = true,
    telescope = true,
    treesitter = true,
    treesittercontext = true,
    trouble = true,
    whichkey = true,
  },
}
]]
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
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
}
