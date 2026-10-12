vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_termcolors = "16"
vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- colors for definition pop out window highlighting
vim.api.nvim_set_hl(0, "CocMenuSel", { fg = "#e4e4e4", bg = "#000000" })
vim.api.nvim_set_hl(0, "CocSearch", { fg = "#0087ff" })

require("auto-dark-mode").setup()
