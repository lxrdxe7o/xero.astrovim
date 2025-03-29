-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

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

vim.cmd "colorscheme cyberdream"

-- Hyprlang LSP
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf" },
  callback = function(event)
    print(string.format("starting hyprls for %s", vim.inspect(event)))
    vim.lsp.start {
      name = "hyprlang",
      cmd = { "hyprls" },
      root_dir = vim.fn.getcwd(),
    }
  end,
})
