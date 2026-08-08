-- Leader key (must be before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & indentation (matching Zed tab_size: 3)
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = ""
vim.opt.scrolloff = 8

-- Behavior
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"
vim.opt.iskeyword:append("-")

-- Undo / swap
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Performance
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- Hide mode text (lualine already shows it)
vim.opt.showmode = false

-- Minimal cmdline height
vim.opt.cmdheight = 0

-- Completion
vim.opt.completeopt = "menu,menuone,noinsert"

-- Netrw disabled
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
