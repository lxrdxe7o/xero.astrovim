return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        hidden = true, -- include hidden files/dirs
        no_ignore = true, -- include files ignored by .gitignore
      },
      live_grep = {
        additional_args = function(_) return { "--hidden", "--no-ignore" } end,
      },
    },
  },
}
