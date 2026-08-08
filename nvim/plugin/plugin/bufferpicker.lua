-- Buffer switcher (floating picker like Zed Ctrl+Tab)
-- Shows only file buffers (no terminals)
-- Ctrl+Tab cycles through, Enter selects, Ctrl+w closes from list

local state = {
   buf = -1,
   win = -1,
   buffers = {},
   selected = 1,
}

local function get_file_buffers()
   local bufs = {}
   for _, b in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(b)
         and vim.bo[b].buflisted
         and vim.bo[b].buftype == ""  -- only file buffers, no terminals
      then
         local name = vim.api.nvim_buf_get_name(b)
         if name ~= "" then
            table.insert(bufs, { id = b, name = vim.fn.fnamemodify(name, ":t"), path = vim.fn.fnamemodify(name, ":.") })
         end
      end
   end
   return bufs
end

local function render()
   if not vim.api.nvim_buf_is_valid(state.buf) then return end
   local lines = {}
   local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
   for i, b in ipairs(state.buffers) do
      local prefix = (i == state.selected) and " ▸ " or "   "
      local icon = ""
      if devicons_ok then
         local ext = vim.fn.fnamemodify(b.name, ":e")
         local ic, _ = devicons.get_icon(b.name, ext, { default = true })
         if ic then icon = ic .. " " end
      end
      lines[i] = prefix .. icon .. b.name .. "  (" .. b.path .. ")"
   end
   vim.api.nvim_buf_set_lines(state.buf, 0, -1, false, lines)

   -- Highlight selected line
   vim.api.nvim_buf_clear_namespace(state.buf, -1, 0, -1)
   if state.selected > 0 and state.selected <= #lines then
      vim.api.nvim_buf_add_highlight(state.buf, -1, "Visual", state.selected - 1, 0, -1)
   end
end

local function close_picker()
   if vim.api.nvim_win_is_valid(state.win) then
      vim.api.nvim_win_close(state.win, true)
   end
   if vim.api.nvim_buf_is_valid(state.buf) then
      vim.api.nvim_buf_delete(state.buf, { force = true })
   end
   state.win = -1
   state.buf = -1
end

local function select_buffer()
   local sel = state.buffers[state.selected]
   close_picker()
   if sel then
      vim.api.nvim_set_current_buf(sel.id)
   end
end

local function remove_buffer()
   local sel = state.buffers[state.selected]
   if not sel then return end
   -- Close the buffer
   vim.api.nvim_buf_delete(sel.id, { force = true })
   table.remove(state.buffers, state.selected)
   if state.selected > #state.buffers then
      state.selected = #state.buffers
   end
   if #state.buffers == 0 then
      close_picker()
      return
   end
   render()
end

local function open_picker()
   state.buffers = get_file_buffers()
   if #state.buffers == 0 then return end

   -- Start on second item (next file)
   state.selected = #state.buffers > 1 and 2 or 1

   local width = math.min(60, math.floor(vim.o.columns * 0.5))
   local height = math.min(#state.buffers + 0, 15)
   local row = math.floor((vim.o.lines - height) / 2)
   local col = math.floor((vim.o.columns - width) / 2)

   state.buf = vim.api.nvim_create_buf(false, true)
   state.win = vim.api.nvim_open_win(state.buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      row = row,
      col = col,
      style = 'minimal',
      border = 'rounded',
      title = ' Open Files ',
      title_pos = 'center',
   })

   vim.bo[state.buf].modifiable = true
   render()
   vim.bo[state.buf].modifiable = false

   -- Keymaps inside picker
   local opts = { buffer = state.buf, noremap = true, silent = true }

   vim.keymap.set('n', '<C-`>', function()
      state.selected = state.selected % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', '<Tab>', function()
      state.selected = state.selected % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', '<S-Tab>', function()
      state.selected = (state.selected - 2) % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', '<CR>', select_buffer, opts)
   vim.keymap.set('n', '<Esc>', close_picker, opts)
   vim.keymap.set('n', 'q', close_picker, opts)

   vim.keymap.set('n', '<C-w>', function()
      vim.bo[state.buf].modifiable = true
      remove_buffer()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', 'j', function()
      state.selected = state.selected % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', 'k', function()
      state.selected = (state.selected - 2) % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', '<Down>', function()
      state.selected = state.selected % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)

   vim.keymap.set('n', '<Up>', function()
      state.selected = (state.selected - 2) % #state.buffers + 1
      vim.bo[state.buf].modifiable = true
      render()
      vim.bo[state.buf].modifiable = false
   end, opts)
end

vim.api.nvim_create_user_command("BufferPicker", open_picker, {})
vim.keymap.set('n', '<C-`>', '<cmd>BufferPicker<CR>', { noremap = true, silent = true, desc = "Cycle open files" })
