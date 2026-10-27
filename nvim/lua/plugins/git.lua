return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      local map = vim.keymap.set
      map("n", "<leader>gi", ":vertical Git<CR>", { desc = "Git status (vertical split)" })
      map("n", "<leader>gP", ":0Gllog<CR>", { desc = "Previous revisions of the current file" })
      map("n", "<leader>gc", ":Git commit<CR>", { desc = "Commit" })
      map("n", "<leader>gC", ":Git commit --amend<CR>", { desc = "Amend" })
      map("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Diff file vs index" })
      map("n", "<leader>gD", ":Gvdiffsplit HEAD<CR>", { desc = "Diff file vs HEAD" })
      map("n", "<leader>gb", ":Git blame<CR>", { desc = "Blame" })
      map("n", "<leader>gn", ":Git switch -c ", { desc = "New branch (type the name, then Enter)" })
      map("n", "<leader>gl",":Git log --oneline --graph --decorate -50<CR>", { desc = "Log graph" })
      map("n", "<leader>gw", ":Gwrite<CR>", { desc = "Stage whole file" })
      map("n", "<leader>gr", ":Gread<CR>", { desc = "Revert file to index" })
      map("n", "<leader>gp", ":Git push<CR>", { desc = "Push" })
      map("n", "<leader>gfp", ":Git push --force-with-lease<CR>", { desc = "Force push with lease" })
      map("n", "<leader>gu",":Git push -u origin HEAD<CR>", { desc = "Push and set upstream" })
      map("n", "<leader>gF", ":Git pull --rebase<CR>", { desc = "Pull --rebase" })
      map({ "n", "v" }, "<leader>go", ":GBrowse<CR>", { desc = "Open line(s) on GitHub" })
      map({ "n", "v" }, "<leader>gy", ":GBrowse!<CR>", { desc = "Copy GitHub URL" })
    end,
  },
  { "tpope/vim-rhubarb", dependencies = { "tpope/vim-fugitive" } }, -- :GBrowse for GitHub
  { "airblade/vim-gitgutter" },
}
