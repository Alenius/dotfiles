return {
  {
    "vim-airline/vim-airline",
    init = function()
      vim.g["airline#extensions#projectdir#enabled"] = 1
    end,
  },

  {
    "preservim/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle", "NERDTreeFind", "NERDTreeFocus" },
    keys = {
      { "<leader>n", ":NERDTreeFind<CR>", desc = "Reveal current file in NERDTree" },
    },
    init = function()
      vim.g.NERDCreateDefaultMappings = 1
      vim.g.NERDTreeWinPos = "right"
    end,
  },
}
