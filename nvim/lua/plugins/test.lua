return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter", -- finds the test functions
      "fredrikaverpil/neotest-golang",
    },
    keys = {
      { "<leader>tn", function() require("neotest").run.run() end, desc = "Test nearest" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test file" },
      { "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Test all" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Test last" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output (float)" },
      { "<leader>tp", function() require("neotest").output_panel.toggle() end, desc = "Test output panel" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
      { "<leader>tx", function() require("neotest").run.stop() end, desc = "Stop test" },
    },
    config = function()
      require("neotest").setup({
        adapters = { require("neotest-golang")({}) },
      })
    end,
  },
}
