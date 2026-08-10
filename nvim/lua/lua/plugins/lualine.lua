return {
   "nvim-lualine/lualine.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("lualine").setup({
         options = { theme = "tokyonight" },
         sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = {
               -- Show keystrokes/partial commands (like 6@a, d2w, etc.)
               {
                  function()
                     local ok, noice = pcall(require, "noice")
                     if ok and noice.api.status.command.has() then
                        return noice.api.status.command.get()
                     end
                     return ""
                  end,
                  color = { fg = "#7aa2f7" },
               },
               -- Show macro recording
               {
                  function()
                     local ok, noice = pcall(require, "noice")
                     if ok and noice.api.status.mode.has() then
                        return noice.api.status.mode.get()
                     end
                     return ""
                  end,
                  color = { fg = "#f7768e" },
               },
               "encoding",
               "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
         },
      })
   end,
}
