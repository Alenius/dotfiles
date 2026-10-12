local map = vim.keymap.set

-- Plugin-specific mappings (fzf, fugitive, NERDTree, LSP) live with their plugin in lua/plugins/

-- Toggle between the current and previous buffer
map("n", "<leader>p", "<C-^>")

-- Move between splits with Ctrl + h/j/k/l
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

-- Resize the current split: + widens, - narrows
map("n", "+", "<C-W>>", { silent = true })
map("n", "-", "<C-W><", { silent = true })
