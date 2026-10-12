return {
  {
    "gruvbox-community/gruvbox",
    lazy = false,
    priority = 1000, -- load before everything else so the colorscheme is set first
    init = function()
      vim.g.gruvbox_contrast_dark = "hard"
      vim.g.gruvbox_contrast_light = "hard"
      vim.g.gruvbox_termcolors = "16"
    end,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- follows the macOS light/dark appearance by flipping 'background'
  { "f-person/auto-dark-mode.nvim", opts = {} },

  -- alternative colorschemes, only loaded when selected with :colorscheme
  { "TheAtlasEngine/PastelColors", lazy = true },
  { "cormacrelf/vim-colors-github", lazy = true },
  { "fcpg/vim-fahrenheit", lazy = true },
}
