local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
   group = augroup("YankHighlight", { clear = true }),
   callback = function()
      vim.highlight.on_yank({ timeout = 200 })
   end,
})

-- Return to last edit position
autocmd("BufReadPost", {
   group = augroup("LastPosition", { clear = true }),
   callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
         pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
   end,
})

-- Auto-start treesitter (tonybanters style)
autocmd("FileType", {
   group = augroup("TreesitterStart", { clear = true }),
   callback = function(args)
      pcall(vim.treesitter.start, args.buf)
   end,
})

-- Autosave (like Zed: after 1 second of no changes)
autocmd({ "InsertLeave", "TextChanged" }, {
   group = augroup("AutoSave", { clear = true }),
   callback = function()
      local buf = vim.api.nvim_get_current_buf()
      if vim.bo[buf].modified and vim.bo[buf].buftype == "" and vim.fn.expand("%") ~= "" then
         vim.defer_fn(function()
            if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modified then
               vim.api.nvim_buf_call(buf, function()
                  vim.cmd("silent! write")
               end)
            end
         end, 1000)
      end
   end,
})
