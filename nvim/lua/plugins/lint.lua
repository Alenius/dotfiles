return {
  {
    "mfussenegger/nvim-lint",
    dependencies = { "mason-org/mason.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        go = { "staticcheck" },
      }

      -- lint the whole package of the current file, not just the file: checking a single file
      -- would report functions used from other files as unused (U1000)
      local staticcheck = lint.linters.staticcheck
      staticcheck.append_fname = false
      staticcheck.args = { "-f", "json", function() return vim.fn.expand("%:p:h") end }

      -- staticcheck reports no end position for some checks (e.g. U1000), which nvim-lint turns
      -- into -1 and Neovim rejects; drop the end so the diagnostic covers the start position only
      local parse = staticcheck.parser
      staticcheck.parser = function(output, bufnr)
        local diagnostics = parse(output, bufnr)
        for _, d in ipairs(diagnostics) do
          if d.end_lnum < 0 or d.end_col < 0 then
            d.end_lnum, d.end_col = nil, nil
          end
        end
        return diagnostics
      end

      -- the staticcheck binary comes from mason
      local registry = require("mason-registry")
      registry.refresh(function()
        local pkg = registry.get_package("staticcheck")
        if not pkg:is_installed() then pkg:install() end
      end)

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
        callback = function()
          -- run from the module root so package paths resolve
          lint.try_lint(nil, { cwd = vim.fs.root(0, "go.mod") or vim.fn.getcwd() })
        end,
      })
    end,
  },
}
