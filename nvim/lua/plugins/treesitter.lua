local parsers = {
  "go", "gomod", "gosum", "gowork",
  "lua", "vim", "vimdoc", "query",
  "python",
  "javascript", "typescript", "tsx", "json", "graphql",
  "hcl", "terraform",
  "markdown", "markdown_inline", -- needed for LSP hover windows
  "bash", "yaml", "sql",
}

return {
  -- pins the signature of the enclosing function/type to the top of the window
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { max_lines = 3, separator = "-" }, -- a row of dashes under the context sets it apart from the code
    config = function(_, opts)
      require("treesitter-context").setup(opts)

      -- the default background is NormalFloat, which is a flat gray in gruvbox; use the editor
      -- background, with a row of dashes (see opts) in gruvbox's gray
      local function set_highlights()
        local gray = vim.api.nvim_get_hl(0, { name = "LineNr", link = false }).fg
        vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
        vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
        local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
        vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = gray, bg = bg })
      end
      set_highlights()
      -- colorscheme changes (including auto-dark-mode flipping 'background') reset the groups
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("UserTreesitterContext", { clear = true }),
        callback = set_highlights,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      -- compiling parsers needs the tree-sitter CLI; get it from mason if it's missing
      local registry = require("mason-registry")
      local function install_parsers()
        require("nvim-treesitter").install(parsers)
      end
      registry.refresh(function()
        local cli = registry.get_package("tree-sitter-cli")
        if cli:is_installed() then
          install_parsers()
        else
          cli:install({}, function(ok)
            if ok then vim.schedule(install_parsers) end
          end)
        end
      end)

      -- turn on tree-sitter highlighting and folding wherever a parser is available
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(ev)
          if pcall(vim.treesitter.start, ev.buf) then
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })
    end,
  },
}
