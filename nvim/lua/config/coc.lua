local map = vim.keymap.set
local fn = vim.fn

-- Show documentation in preview window
map("n", "gh", function()
  if vim.tbl_contains({ "vim", "help" }, vim.bo.filetype) then
    vim.cmd("help " .. fn.expand("<cword>"))
  else
    fn.CocAction("doHover")
  end
end, { silent = true })

-- Use tab for trigger completion with characters ahead and navigate.
map("i", "<TAB>", function()
  if fn["coc#pum#visible"]() == 1 then
    return fn["coc#pum#next"](0)
  end
  return "<TAB>"
end, { silent = true, expr = true })
map("i", "<S-TAB>", function()
  if fn["coc#pum#visible"]() == 1 then
    return fn["coc#pum#prev"](0)
  end
  return "<S-TAB>"
end, { silent = true, expr = true })
-- Use enter to choose completion
map("i", "<CR>", function()
  if fn["coc#pum#visible"]() == 1 then
    return fn["coc#pum#confirm"]()
  end
  return "<CR>"
end, { silent = true, expr = true })

-- Use <c-space> to trigger completion.
map("i", "<c-space>", function() return fn["coc#refresh"]() end, { silent = true, expr = true })

map("n", "gd", "<Plug>(coc-definition)", { silent = true, remap = true })
map("n", "gsd", ":vs<CR><Plug>(coc-definition)", { silent = true, remap = true })
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true, remap = true })
map("n", "gi", "<Plug>(coc-implementation)", { silent = true, remap = true })
map("n", "gr", "<Plug>(coc-references)", { silent = true, remap = true })
map("n", "<leader>rn", "<Plug>(coc-rename)", { remap = true })

map("n", "[c", function() fn.CocAction("diagnosticNext") end, { silent = true })
map("n", "]c", function() fn.CocAction("diagnosticPrevious") end, { silent = true })
