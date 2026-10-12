local map = vim.keymap.set

-- Finding files (fzf.vim)
map("n", "<leader>ff", ":GFiles<CR>")  -- files tracked by git
map("n", "<leader>faf", ":Files<CR>")  -- all files under cwd
map("n", "<leader>dd", ":Buffers<CR>") -- open buffers
map("n", "<leader>rr", ":Rg ")         -- ripgrep; waits for you to type the pattern
-- git files restricted to the current file's directory
map("n", "<leader>cff", ':GFiles <C-r>=expand("%:h")<CR>/<CR>', { silent = true })

-- Git (fugitive)
map("n", "<leader>gi", ":vertical Git<CR>") -- git status in a vertical split
-- previous git revisions of the current file
map("n", "<leader>gp", ":0GlLog<CR>")

-- Misc plugins
map("n", "<leader>af", ":CocCommand eslint.executeAutofix<CR>") -- eslint autofix via coc
map("n", "<leader>n", ":NERDTreeFind<CR>")                      -- reveal current file in NERDTree

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
