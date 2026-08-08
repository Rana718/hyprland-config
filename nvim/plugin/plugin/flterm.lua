-- Multi floating terminal (Zed-like)
-- Ctrl+\       = toggle terminal
-- Ctrl+Tab     = next terminal (in terminal mode)
-- Ctrl+w       = close current terminal (in terminal mode)
-- <leader>tn   = open new terminal

local terminals = {} -- list of { buf, win }
local current_idx = 0

local function create_float_win(buf)
   local width = math.floor(vim.o.columns * 0.8)
   local height = math.floor(vim.o.lines * 0.8)
   local row = math.floor((vim.o.lines - height) / 2)
   local col = math.floor((vim.o.columns - width) / 2)

   local win = vim.api.nvim_open_win(buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      row = row,
      col = col,
      style = 'minimal',
      border = 'rounded',
   })
   return win
end

local function new_terminal()
   local buf = vim.api.nvim_create_buf(false, true)
   local win = create_float_win(buf)
   vim.cmd.terminal()
   vim.cmd("startinsert!")
   table.insert(terminals, { buf = buf, win = win })
   current_idx = #terminals
end

local function hide_current()
   if current_idx > 0 and current_idx <= #terminals then
      local t = terminals[current_idx]
      if vim.api.nvim_win_is_valid(t.win) then
         vim.api.nvim_win_hide(t.win)
         t.win = -1
      end
   end
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
   vim.cmd("startinsert!")
end

local function toggle_terminal()
   -- If a terminal window is visible, hide it
   if current_idx > 0 and current_idx <= #terminals then
      local t = terminals[current_idx]
      if vim.api.nvim_win_is_valid(t.win) then
         hide_current()
         return
      end
   end

   -- If we have terminals, show the current one
   if #terminals > 0 then
      if current_idx < 1 then current_idx = 1 end
      show_terminal(current_idx)
   else
      -- No terminals yet, create one
      new_terminal()
   end
end

local function next_terminal()
   if #terminals <= 1 then return end
   hide_current()
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
   -- If there are still terminals, show the next one
   if #terminals > 0 then
      show_terminal(current_idx)
   end
end

vim.api.nvim_create_user_command("Flterm", toggle_terminal, {})
vim.api.nvim_create_user_command("FlternNew", new_terminal, {})
vim.api.nvim_create_user_command("FlternNext", next_terminal, {})
vim.api.nvim_create_user_command("FlternClose", close_terminal, {})

-- Keymaps
vim.keymap.set('n', '<leader>ft', '<cmd>Flterm<CR>', { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set('n', '<C-\\>', '<cmd>Flterm<CR>', { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set('t', '<C-\\>', '<cmd>Flterm<CR>', { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set('t', '<C-Tab>', '<cmd>FlternNext<CR>', { noremap = true, silent = true, desc = "Next terminal" })
vim.keymap.set('t', '<C-w>', '<cmd>FlternClose<CR>', { noremap = true, silent = true, desc = "Close terminal" })
vim.keymap.set('n', '<C-S-\\>', '<cmd>FlternNew<CR>', { noremap = true, silent = true, desc = "New terminal" })
vim.keymap.set('t', '<C-S-\\>', '<cmd>FlternNew<CR>', { noremap = true, silent = true, desc = "New terminal" })
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>', { noremap = true, silent = true, desc = "Exit terminal mode" })
