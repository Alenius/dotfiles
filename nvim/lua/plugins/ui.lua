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
    opts = { win = { border = "rounded" } },
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer-local keymaps" },
    },
    config = function(_, opts)
      require("which-key").setup(opts)

      -- the default background is NormalFloat, a flat gray in gruvbox; use the editor background
      -- and let a gray border (the same color as line numbers) set the popup apart
      local function set_highlights()
        local gray = vim.api.nvim_get_hl(0, { name = "LineNr", link = false }).fg
        local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
        vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
        vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = gray, bg = bg })
      end
      set_highlights()
      -- colorscheme changes (including auto-dark-mode flipping 'background') reset the groups
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("UserWhichKeyHighlights", { clear = true }),
        callback = set_highlights,
      })
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
