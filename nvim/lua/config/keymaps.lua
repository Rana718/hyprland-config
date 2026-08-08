local map = vim.keymap.set

-----------------------------------------------------------
-- ZED KEYBINDINGS (priority - do not change)
-----------------------------------------------------------

-- Insert mode (Zed: Editor && vim_mode == insert)
map("i", "<C-c>", "<Esc>", { desc = "Escape (Zed)" })
map("i", "<C-v>", '<Esc>"+pa', { desc = "Paste (Zed)" })
map("i", "<C-x>", "<Esc>ddi", { desc = "Cut line (Zed)" })
map("i", "<C-y>", "<cmd>redo<CR>", { desc = "Redo (Zed)" })
map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all (Zed)" })
map("i", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files (Zed)" })
map("i", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle tree (Zed)" })

-- Normal mode (Zed: Editor && vim_mode == normal)
map("n", "'", ";", { desc = "Repeat find (Zed)" })
map("n", "U", "<C-r>", { desc = "Redo (Zed)" })
map("n", "gn", "gn", { desc = "Select all matches (Zed)" })
map("n", "<leader>f", function()
   require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format (Zed)" })
map("n", "<leader>i", "<cmd>lua vim.lsp.buf.code_action({context={only={'source.organizeImports'}}})<CR>", { desc = "Organize imports (Zed)" })
map("n", "<leader>j", vim.diagnostic.goto_next, { desc = "Next diagnostic (Zed)" })
map("n", "<leader>'", vim.diagnostic.goto_prev, { desc = "Prev diagnostic (Zed)" })
map("n", "<leader>p", "<cmd>Telescope commands<CR>", { desc = "Command palette (Zed)" })
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle tree focus (Zed)" })
map("n", "<leader>\\", "<cmd>NvimTreeCollapseAll<CR>", { desc = "Collapse tree (Zed)" })
map("n", "<leader>o", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Outline (Zed)" })
map("n", "<leader>w", "<cmd>bd<CR>", { desc = "Close buffer (Zed)" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>qa", "<cmd>qa!<CR>", { desc = "Close all (Zed)" })

-- Editor bindings (Zed)
map("n", "<C-[>", "zc", { desc = "Fold (Zed)" })
map("n", "<C-]>", "zo", { desc = "Unfold (Zed)" })
map("n", "<C-A-[>", "zM", { desc = "Fold all (Zed)" })
map("n", "<C-A-]>", "zR", { desc = "Unfold all (Zed)" })

-- Global (Zed)
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle left panel (Zed)" })
map("n", "<C-k>", "<C-w>k", { desc = "Activate pane up (Zed)" })
map("n", "<A-r>", "<cmd>Telescope oldfiles<CR>", { desc = "Open recent (Zed)" })

-----------------------------------------------------------
-- TERMINAL (floating, like tonybanters/Zed style)
-----------------------------------------------------------
map("n", "<leader>ft", "<cmd>Flterm<CR>", { desc = "Floating terminal" })
map("n", "<C-\\>", "<cmd>Flterm<CR>", { desc = "Toggle terminal" })
map("t", "<C-\\>", "<cmd>Flterm<CR>", { desc = "Toggle terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

-- Multiple terminals: Ctrl+Tab to cycle, Ctrl+w to close
map("t", "<C-Tab>", "<cmd>FlternNext<CR>", { desc = "Next terminal" })
map("t", "<C-w>", "<cmd>FlternClose<CR>", { desc = "Close terminal" })
map("n", "<C-S-\\>", "<cmd>FlternNew<CR>", { desc = "New terminal" })

-----------------------------------------------------------
-- TONYBANTERS STYLE BINDINGS
-----------------------------------------------------------

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Join lines (keep cursor)
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next match centered" })
map("n", "N", "Nzzzv", { desc = "Prev match centered" })

-- Paste without overwrite
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwrite" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })

-- Disable Q (Ex mode)
map("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Quickfix navigation
map("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
map("n", "<leader>cl", ":cclose<CR>", { silent = true, desc = "Close quickfix" })
map("n", "<leader>co", ":copen<CR>", { silent = true, desc = "Open quickfix" })
map("n", "<leader>cn", ":cnext<CR>zz", { desc = "Next quickfix" })
map("n", "<leader>cp", ":cprev<CR>zz", { desc = "Prev quickfix" })

-- Replace word under cursor
map("n", "<leader>s", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word on line" })

-- Make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })

-- Source file
map("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source file" })

-- Buffers (Ctrl+Tab opens picker, Ctrl+w closes current)
map("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Move between editor and tree (Ctrl+r)
map("n", "<C-r>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file tree" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Clear highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-----------------------------------------------------------
-- TELESCOPE
-----------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", function()
   require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep search" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Find current string" })
map("n", "<leader>fq", "<cmd>Telescope quickfix<CR>", { desc = "Quickfix" })
map("n", "<leader>fm", function()
   require("telescope.builtin").man_pages({ sections = { "ALL" } })
end, { desc = "Man pages" })
map("n", "<leader>fi", function()
   require("telescope.builtin").find_files({ cwd = "~/.config/nvim/" })
end, { desc = "Find nvim config" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

-----------------------------------------------------------
-- HARPOON
-----------------------------------------------------------
map("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon add" })
map("n", "<C-e>", function()
   require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Harpoon menu" })

-----------------------------------------------------------
-- LSP (set on LspAttach in lsp.lua)
-----------------------------------------------------------
-- K = hover, gd = definition, gD = declaration
-- gi = implementation, go = type definition
-- gr = references, gs = signature help
-- gl = diagnostic float, F2 = rename
-- F3 = format, F4 = code action
-- <leader>li = LSP info
map("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP Info" })
