return {
   "nvimdev/dashboard-nvim",
   event = "VimEnter",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("dashboard").setup({
         theme = "hyper",
         config = {
            header = {
               "",
               "  ██████╗ ██╗██████╗  █████╗ ",
               "  ██╔══██╗██║██╔══██╗██╔══██╗",
               "  ██║  ██║██║██████╔╝███████║",
               "  ██║  ██║██║██╔══██╗██╔══██║",
               "  ██████╔╝██║██║  ██║██║  ██║",
               "  ╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝",
               "",
               "        ✨ god's plan 🙏        ",
               "",
            },
            shortcut = {
               {
                  icon = " ",
                  desc = "Find File",
                  key = "f",
                  action = "Telescope find_files",
               },
               {
                  icon = " ",
                  desc = "Recent Files",
                  key = "r",
                  action = "Telescope oldfiles",
               },
               {
                  icon = " ",
                  desc = "Live Grep",
                  key = "g",
                  action = "Telescope live_grep",
               },
               {
                  icon = " ",
                  desc = "File Tree",
                  key = "e",
                  action = "NvimTreeToggle",
               },
               {
                  icon = " ",
                  desc = "Config",
                  key = "c",
                  action = "Telescope find_files cwd=~/.config/nvim",
               },
               {
                  icon = "󰒲 ",
                  desc = "Lazy",
                  key = "l",
                  action = "Lazy",
               },
               {
                  icon = " ",
                  desc = "Quit",
                  key = "q",
                  action = "qa",
               },
            },
            footer = function()
               local stats = require("lazy").stats()
               return {
                  "",
                  "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins",
               }
            end,
         },
      })
   end,
}
