return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>gi", ":vertical Git<CR>") -- git status in a vertical split
      vim.keymap.set("n", "<leader>gp", ":0GlLog<CR>")       -- previous git revisions of the current file
    end,
  },
  { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" } }, -- :GBrowse for GitHub
  { "airblade/vim-gitgutter" },
}
