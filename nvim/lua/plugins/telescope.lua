return {
   "nvim-telescope/telescope.nvim",
   branch = "master",
   dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
   },
   config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
         defaults = {
            mappings = {
               i = {
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
               },
            },
            file_ignore_patterns = { "node_modules", ".git/" },
         },
         pickers = { find_files = { hidden = true } },
      })
      pcall(require("telescope").load_extension, "fzf")
   end,
}
