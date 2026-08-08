return {
   "nvim-tree/nvim-tree.lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("nvim-tree").setup({
         view = {
            width = 30,
            side = "left",
            signcolumn = "no",
         },
         renderer = {
            group_empty = true,
            icons = {
               show = { file = true, folder = true, folder_arrow = true, git = true },
               glyphs = {
                  folder = {
                     arrow_closed = "",
                     arrow_open = "",
                  },
               },
            },
            indent_markers = { enable = true },
         },
         filters = { dotfiles = false },
         git = { enable = true, ignore = false },
      })
   end,
}
