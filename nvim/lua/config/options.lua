local opt = vim.opt

-- <leader> is space; must be set before any mapping that uses it
vim.g.mapleader = " "

-- Indentation: 2 spaces, no hard tabs
opt.tabstop = 2        -- width of a literal tab character
opt.softtabstop = 2    -- spaces inserted/removed per <Tab>/<BS>
opt.shiftwidth = 2     -- spaces per indent level (>>, <<, autoindent)
opt.expandtab = true   -- insert spaces instead of tab characters
opt.smartindent = true -- auto-indent new lines based on syntax

-- Line numbers: absolute on the current line, relative on the others
opt.number = true
opt.relativenumber = true

-- Keep 8 lines of context above/below the cursor when scrolling
opt.scrolloff = 8

-- Search
opt.hlsearch = false  -- don't keep matches highlighted after searching
opt.incsearch = true  -- show matches while typing the pattern
opt.ignorecase = true -- case-insensitive search...
opt.smartcase = true  -- ...unless the pattern contains an uppercase letter

-- Time (ms) of inactivity before CursorHold fires (diagnostic float, gitgutter updates)
opt.updatetime = 300

-- Buffers/windows
opt.hidden = true     -- allow switching away from a buffer with unsaved changes
opt.splitright = true -- open vertical splits to the right

-- UI
opt.errorbells = false  -- no beeping on errors
opt.wrap = false        -- don't soft-wrap long lines
opt.signcolumn = "yes"  -- always show the sign column (git/diagnostics) so text doesn't shift
opt.termguicolors = true -- 24-bit color
opt.cursorline = true   -- highlight the line the cursor is on

-- Show whitespace: tabs as ">-", spaces as dots
opt.list = true
opt.listchars = { tab = ">-" }
opt.listchars:append({ space = "·" })

-- Show the file name in the terminal tab/window title
opt.title = true
opt.titlestring = "%f"

-- Folding: syntax-based, and open folds when jumping into them
-- (search, marks, etc.) but not on block motions like { and }
opt.foldmethod = "syntax"
opt.foldopen:append("jump")
opt.foldopen:remove("block")
