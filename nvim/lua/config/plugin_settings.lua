vim.g.NERDCreateDefaultMappings = 1
vim.g.NERDTreeWinPos = "right"

vim.g["airline#extensions#projectdir#enabled"] = 1

vim.g.copilot_filetypes = { xml = false }

vim.g.go_gopls_settings = { ["ui.diagnostic.staticcheck"] = true }

require("CopilotChat").setup({
  debug = false, -- Enable debugging
  -- See Configuration section for rest
})
