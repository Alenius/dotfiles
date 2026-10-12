return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- release tags ship a prebuilt fuzzy-matching binary
    opts = {
      keymap = {
        preset = "none",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "fallback" },
      },
    },
  },
}
