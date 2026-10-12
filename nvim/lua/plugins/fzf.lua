return {
  {
    "junegunn/fzf.vim",
    dependencies = {
      { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
    },
    cmd = { "Files", "GFiles", "Buffers", "Rg" },
    keys = {
      { "<leader>ff", ":GFiles<CR>", desc = "Files tracked by git" },
      { "<leader>faf", ":Files<CR>", desc = "All files under cwd" },
      { "<leader>dd", ":Buffers<CR>", desc = "Open buffers" },
      { "<leader>rr", ":Rg ", desc = "ripgrep (type the pattern)" },
      {
        "<leader>cff",
        ':GFiles <C-r>=expand("%:h")<CR>/<CR>',
        silent = true,
        desc = "Git files in the current file's directory",
      },
    },
  },
}
