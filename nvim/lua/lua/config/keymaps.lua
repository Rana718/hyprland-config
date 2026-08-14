local map = vim.keymap.set

-----------------------------------------------------------
-- INSERT MODE
-----------------------------------------------------------
map("i", "<C-c>", "<Esc>", { desc = "Escape" })
map("i", "<C-v>", '<Esc>"+pa', { desc = "Paste from clipboard" })
map("i", "<C-x>", "<Esc>ddi", { desc = "Cut line" })
map("i", "<C-y>", "<cmd>redo<CR>", { desc = "Redo" })
map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all" })
map("i", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("i", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-----------------------------------------------------------
-- NORMAL MODE - GENERAL
-----------------------------------------------------------
map("n", "'", ";", { desc = "Repeat find" })
map("n", "U", "<C-r>", { desc = "Redo" })
map("n", "gn", "gn", { desc = "Select next match" })
map("n", "<leader>f", function()
   require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })
map("n", "<leader>i", "<cmd>lua vim.lsp.buf.code_action({context={only={'source.organizeImports'}}})<CR>", { desc = "Organize imports" })
map("n", "<leader>j", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>'", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "<leader>p", "<cmd>Telescope commands<CR>", { desc = "Command palette" })
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle tree + focus file" })
map("n", "<leader>\\", "<cmd>NvimTreeCollapseAll<CR>", { desc = "Collapse file tree" })
map("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Symbol outline" })
map("n", "<leader>w", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>qa", "<cmd>qa!<CR>", { desc = "Close all" })
map("n", "<A-q>", "<cmd>qa!<CR>", { desc = "Force quit nvim" })

-----------------------------------------------------------
-- FOLDING
-----------------------------------------------------------
map("n", "<C-[>", "zc", { desc = "Fold block" })
map("n", "<C-]>", "zo", { desc = "Unfold block" })
map("n", "<C-A-[>", "zM", { desc = "Fold all" })
map("n", "<C-A-]>", "zR", { desc = "Unfold all" })

-----------------------------------------------------------
-- PANELS & NAVIGATION
-----------------------------------------------------------
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<A-r>", "<cmd>Telescope oldfiles<CR>", { desc = "Open recent files" })
map("n", "<C-r>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-----------------------------------------------------------
-- TERMINAL
-----------------------------------------------------------
map("n", "<leader>ft", "<cmd>Flterm<CR>", { desc = "Open floating terminal" })
map("n", "<C-\\>", "<cmd>Flterm<CR>", { desc = "Toggle terminal" })
map("t", "<C-\\>", "<cmd>Flterm<CR>", { desc = "Toggle terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
map("t", "<C-`>", "<cmd>FlternNext<CR>", { desc = "Next terminal" })
map("t", "<C-w>", "<cmd>FlternClose<CR>", { desc = "Close terminal" })
map("n", "<C-S-\\>", "<cmd>FlternNew<CR>", { desc = "New terminal" })

-----------------------------------------------------------
-- EDITING
-----------------------------------------------------------
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
map("n", "n", "nzzzv", { desc = "Next match (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev match (centered)" })
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwrite" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void register" })
map("n", "dd", [["_dd]], { desc = "Delete line (no yank)" })
map("n", "Q", "<nop>", { desc = "Disabled" })

-----------------------------------------------------------
-- QUICKFIX
-----------------------------------------------------------
map("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<leader>cl", ":cclose<CR>", { silent = true, desc = "Close quickfix" })
map("n", "<leader>co", ":copen<CR>", { silent = true, desc = "Open quickfix" })
map("n", "<leader>cn", ":cnext<CR>zz", { desc = "Next quickfix item" })
map("n", "<leader>cp", ":cprev<CR>zz", { desc = "Prev quickfix item" })

-----------------------------------------------------------
-- SEARCH & REPLACE
-----------------------------------------------------------
map("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word on line" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<C-g>", function()
   require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Global search (prompt)" })
map("n", "<C-g><C-w>", "<cmd>Telescope grep_string<CR>", { desc = "Search word under cursor" })

-----------------------------------------------------------
-- BUFFERS & WINDOWS
-----------------------------------------------------------
map("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-----------------------------------------------------------
-- UTILITIES
-----------------------------------------------------------
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })
map("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source current file" })

-----------------------------------------------------------
-- TELESCOPE
-----------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "Quickfix list" })
map("n", "<leader>fm", function()
   require("telescope.builtin").man_pages({ sections = { "ALL" } })
end, { desc = "Man pages" })
map("n", "<leader>fi", function()
   require("telescope.builtin").find_files({ cwd = "~/.config/nvim/" })
end, { desc = "Nvim config files" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

-----------------------------------------------------------
-- HARPOON
-----------------------------------------------------------
map("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Add to harpoon" })
map("n", "<C-e>", function()
   require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Harpoon quick menu" })

-----------------------------------------------------------
-- LSP (set on LspAttach in lsp.lua)
-----------------------------------------------------------
-- K = hover, gd = definition, gD = declaration
-- gi = implementation, go = type definition
-- gr = references, gs = signature help
-- gl = diagnostic float, F2 = rename
-- F3 = format, F4 = code action
map("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP health check" })

-----------------------------------------------------------
-- SHORTCUT FINDER (Ctrl+. to search all keybindings)
-----------------------------------------------------------
map("n", "<C-.>", "<cmd>Telescope keymaps<CR>", { desc = "Search all keybindings" })
map("i", "<C-.>", "<cmd>Telescope keymaps<CR>", { desc = "Search all keybindings" })
map("v", "<C-.>", "<cmd>Telescope keymaps<CR>", { desc = "Search all keybindings" })
map("t", "<C-.>", function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
   vim.schedule(function() vim.cmd("Telescope keymaps") end)
end, { noremap = true, silent = true, desc = "Search all keybindings" })
