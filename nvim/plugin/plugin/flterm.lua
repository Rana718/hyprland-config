-- ═══════════════════════════════════════════════════════════════
-- Floating Multi-Terminal
-- ═══════════════════════════════════════════════════════════════
-- Ctrl+\         = show/hide terminal
-- Ctrl+`         = cycle terminals (in terminal) / buffer picker (in editor)
-- Ctrl+Shift+\   = new terminal
-- Ctrl+w         = close current terminal (in terminal)
-- ═══════════════════════════════════════════════════════════════

local terminals = {}
local current_idx = 0
_G._flterm_tab_buf = -1
_G._flterm_tab_win = -1

-- ── UI ───────────────────────────────────────────────────────

local function get_dimensions()
   local width = math.floor(vim.o.columns * 0.8)
   local total_height = math.floor(vim.o.lines * 0.8)
   local height = total_height - 2
   local row = math.floor((vim.o.lines - total_height) / 2)
   local col = math.floor((vim.o.columns - width) / 2)
   return width, height, row, col
end

local function create_float_win(buf)
   local width, height, row, col = get_dimensions()
   return vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
      title = "  Terminal ",
      title_pos = "left",
   })
end

local function render_tab_bar()
   if #terminals <= 1 then
      if vim.api.nvim_win_is_valid(_G._flterm_tab_win) then
         vim.api.nvim_win_close(_G._flterm_tab_win, true)
         _G._flterm_tab_win = -1
      end
      return
   end

   local width, height, row, col = get_dimensions()
   -- Position below the terminal: row + height + 2 (border top/bottom)
   local tab_row = row + height + 2

   -- Build tab content
   local parts = {}
   for i, _ in ipairs(terminals) do
      if i == current_idx then
         table.insert(parts, " ● " .. i .. " ")
      else
         table.insert(parts, " ○ " .. i .. " ")
      end
   end
   local line = table.concat(parts, "│")

   -- Buffer
   if not vim.api.nvim_buf_is_valid(_G._flterm_tab_buf) then
      _G._flterm_tab_buf = vim.api.nvim_create_buf(false, true)
   end
   vim.api.nvim_buf_set_lines(_G._flterm_tab_buf, 0, -1, false, { line })

   -- Window
   if vim.api.nvim_win_is_valid(_G._flterm_tab_win) then
      vim.api.nvim_win_close(_G._flterm_tab_win, true)
   end

   _G._flterm_tab_win = vim.api.nvim_open_win(_G._flterm_tab_buf, false, {
      relative = "editor",
      width = width,
      height = 1,
      row = tab_row,
      col = col,
      style = "minimal",
      border = "rounded",
      focusable = false,
      title = " terminals ",
      title_pos = "center",
   })
end

local function hide_tab_bar()
   if vim.api.nvim_win_is_valid(_G._flterm_tab_win or -1) then
      vim.api.nvim_win_close(_G._flterm_tab_win, true)
      _G._flterm_tab_win = -1
   end
end

-- ── Core Logic ───────────────────────────────────────────────

local function any_terminal_visible()
   for _, t in ipairs(terminals) do
      if vim.api.nvim_win_is_valid(t.win) then
         return true
      end
   end
   return false
end

local function hide_all_terminals()
   for _, t in ipairs(terminals) do
      if vim.api.nvim_win_is_valid(t.win) then
         vim.api.nvim_win_hide(t.win)
         t.win = -1
      end
   end
   hide_tab_bar()
end

local function show_terminal(idx)
   if idx < 1 or idx > #terminals then return end
   local t = terminals[idx]
   if not vim.api.nvim_buf_is_valid(t.buf) then
      table.remove(terminals, idx)
      if current_idx > #terminals then current_idx = #terminals end
      return
   end
   t.win = create_float_win(t.buf)
   current_idx = idx
   render_tab_bar()
   vim.cmd("startinsert!")
end

local function toggle_terminal()
   if any_terminal_visible() then
      hide_all_terminals()
      return
   end
   if #terminals > 0 then
      if current_idx < 1 then current_idx = 1 end
      show_terminal(current_idx)
   else
      local buf = vim.api.nvim_create_buf(false, true)
      local win = create_float_win(buf)
      vim.cmd.terminal()
      vim.cmd("startinsert!")
      table.insert(terminals, { buf = buf, win = win })
      current_idx = 1
      render_tab_bar()
   end
end

local function new_terminal()
   -- Hide current if visible
   if any_terminal_visible() then
      for _, t in ipairs(terminals) do
         if vim.api.nvim_win_is_valid(t.win) then
            vim.api.nvim_win_hide(t.win)
            t.win = -1
         end
      end
   end
   local buf = vim.api.nvim_create_buf(false, true)
   local win = create_float_win(buf)
   vim.cmd.terminal()
   vim.cmd("startinsert!")
   table.insert(terminals, { buf = buf, win = win })
   current_idx = #terminals
   render_tab_bar()
end

local function next_terminal()
   if #terminals <= 1 then return end
   -- Hide current
   local t = terminals[current_idx]
   if t and vim.api.nvim_win_is_valid(t.win) then
      vim.api.nvim_win_hide(t.win)
      t.win = -1
   end
   current_idx = current_idx % #terminals + 1
   show_terminal(current_idx)
end

local function close_terminal()
   if current_idx < 1 or current_idx > #terminals then return end
   local t = terminals[current_idx]
   if vim.api.nvim_win_is_valid(t.win) then
      vim.api.nvim_win_hide(t.win)
   end
   if vim.api.nvim_buf_is_valid(t.buf) then
      vim.api.nvim_buf_delete(t.buf, { force = true })
   end
   table.remove(terminals, current_idx)
   if current_idx > #terminals then current_idx = #terminals end
   if #terminals > 0 then
      show_terminal(current_idx)
   else
      hide_tab_bar()
   end
end

-- ── Commands ─────────────────────────────────────────────────

vim.api.nvim_create_user_command("Flterm", toggle_terminal, {})
vim.api.nvim_create_user_command("FlternNew", new_terminal, {})
vim.api.nvim_create_user_command("FlternNext", next_terminal, {})
vim.api.nvim_create_user_command("FlternClose", close_terminal, {})

-- ── Keymaps ──────────────────────────────────────────────────

-- Normal mode
vim.keymap.set("n", "<C-\\>", toggle_terminal, { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>ft", toggle_terminal, { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set("n", "<C-S-\\>", new_terminal, { noremap = true, silent = true, desc = "New terminal" })

-- Terminal mode: Ctrl+\ to hide (go to normal first, then toggle)
vim.keymap.set("t", "<C-\\>", function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
   vim.schedule(toggle_terminal)
end, { noremap = true, silent = true, desc = "Hide terminal" })

-- Terminal mode: Ctrl+` to cycle
vim.keymap.set("t", "<C-`>", function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
   vim.schedule(next_terminal)
end, { noremap = true, silent = true, desc = "Next terminal" })

-- Terminal mode: Ctrl+w to close
vim.keymap.set("t", "<C-w>", function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
   vim.schedule(close_terminal)
end, { noremap = true, silent = true, desc = "Close terminal" })

-- Terminal mode: Ctrl+Shift+\ for new
vim.keymap.set("t", "<C-S-\\>", function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
   vim.schedule(new_terminal)
end, { noremap = true, silent = true, desc = "New terminal" })

-- Esc Esc to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Normal mode: Ctrl+` context-aware (buffer picker or hide terminal)
vim.keymap.set("n", "<C-`>", function()
   if any_terminal_visible() then
      hide_all_terminals()
   else
      vim.cmd("BufferPicker")
   end
end, { noremap = true, silent = true, desc = "Buffer picker / hide terminal" })
