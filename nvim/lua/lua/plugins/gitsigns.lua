return {
   "lewis6991/gitsigns.nvim",
   event = { "BufReadPre", "BufNewFile" },
   config = function()
      require("gitsigns").setup({
         signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
         },
         signs_staged = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
         },
         -- VS Code style colors
         on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
               opts = opts or {}
               opts.buffer = bufnr
               vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation between hunks
            map("n", "]c", function()
               if vim.wo.diff then return "]c" end
               vim.schedule(function() gs.next_hunk() end)
               return "<Ignore>"
            end, { expr = true, desc = "Next git hunk" })

            map("n", "[c", function()
               if vim.wo.diff then return "[c" end
               vim.schedule(function() gs.prev_hunk() end)
               return "<Ignore>"
            end, { expr = true, desc = "Prev git hunk" })

            -- Actions
            map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
            map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
            map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
            map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
            map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
            map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
            map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
            map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
            map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
            map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
            map("n", "<leader>gD", function() gs.diffthis("~") end, { desc = "Diff this ~" })
            map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })
         end,
      })

      -- VS Code-like colors for git signs
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#73c991" })          -- green (added)
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#e2c08d" })       -- yellow/orange (modified)
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f14c4c" })       -- red (deleted)
      vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#f14c4c" })
      vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#e2c08d" })
      vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#73c991" })
   end,
}
