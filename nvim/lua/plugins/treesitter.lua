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

      -- turn on tree-sitter highlighting wherever a parser is available
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
}
