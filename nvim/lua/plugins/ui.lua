return {
  {
    "vim-airline/vim-airline",
    init = function()
      vim.g["airline#extensions#projectdir#enabled"] = 1
    end,
  },

  -- pops up the available mappings after pressing a prefix key like <leader> or g
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer-local keymaps" },
    },
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
