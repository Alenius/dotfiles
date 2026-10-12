-- keep split when closing buffer
vim.api.nvim_create_user_command("Bd", "bp | sp | bn | bd", {})

function _G.GotoWindow(id)
  vim.fn.win_gotoid(id)
  vim.cmd("MaximizerToggle")
end

local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- make it easier to open buffers from quickfix window
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "qf",
  callback = function(ev)
    vim.keymap.set("n", "<leader><Enter>", "<C-w><Enter><C-w>L", { buffer = ev.buf })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  pattern = "*.graphql",
  command = "setlocal tabstop=3 shiftwidth=3 expandtab!",
})
