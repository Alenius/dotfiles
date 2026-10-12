return {
  -- gives lua_ls knowledge of the `vim` global and Neovim's runtime API
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- installs language servers into nvim's data dir (and enables them via mason-lspconfig)
  { "mason-org/mason.nvim", opts = {} },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig", -- provides the default config (cmd, filetypes, root markers) for each server
      "saghen/blink.cmp",
    },
    config = function()
      -- completion capabilities for every server
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false },
          },
        },
      })

      require("mason-lspconfig").setup({
        -- installed by mason on first start; installed servers are enabled automatically
        ensure_installed = { "gopls", "lua_ls", "pyright", "terraformls", "ts_ls", "eslint" },
      })

      -- show the diagnostic under the cursor in a floating window when the cursor rests
      -- (see 'updatetime' in options.lua for the delay)
      vim.diagnostic.config({ float = { border = "rounded", source = true } })
      vim.api.nvim_create_autocmd("CursorHold", {
        group = vim.api.nvim_create_augroup("UserDiagnosticFloat", { clear = true }),
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
        end,
      })

      -- the default `gr*` mappings would make plain `gr` wait for a follow-up key
      for _, lhs in ipairs({ "grr", "grn", "gri", "grt", "gra", "grx" }) do
        pcall(vim.keymap.del, { "n", "x" }, lhs)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
          end

          map("gh", function()
            vim.lsp.buf.hover({ border = "rounded", max_width = 90, max_height = 30 })
          end, "Hover documentation (press again to focus the window)")
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gsd", function()
            vim.cmd("vsplit")
            vim.lsp.buf.definition()
          end, "Go to definition in a vertical split")
          map("gy", vim.lsp.buf.type_definition, "Go to type definition")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "References")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("[c", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
          map("]c", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous diagnostic")
          -- apply every "fix all" code action the attached servers offer (eslint, gopls, ts_ls, ...)
          map("<leader>af", function()
            vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
          end, "Autofix all fixable problems")
          map("<leader>ca", vim.lsp.buf.code_action, "Code actions (pick a fix)")
        end,
      })

      -- format on save for go/json/sql, when a server that can format is attached
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("UserLspFormat", { clear = true }),
        pattern = { "*.go", "*.json", "*.sql" },
        callback = function(ev)
          if #vim.lsp.get_clients({ bufnr = ev.buf, method = "textDocument/formatting" }) > 0 then
            vim.lsp.buf.format({ bufnr = ev.buf, async = false })
          end
        end,
      })
    end,
  },
}
