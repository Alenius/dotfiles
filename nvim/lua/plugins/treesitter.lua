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
    opts = { max_lines = 3 },
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
