return {
  -- note: copilot.lua is installed but setup() is not called (suggestions disabled)
  {
    "zbirenbaum/copilot.lua",
    dependencies = { "copilotlsp-nvim/copilot-lsp" },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
  },
}
