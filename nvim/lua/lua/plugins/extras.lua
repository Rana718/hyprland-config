return {
   -- Harpoon 2 (tonybanters style quick file switching)
   {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
         require("harpoon"):setup()
      end,
   },

   -- Undotree
   { "mbbill/undotree" },

   -- Git fugitive
   { "tpope/vim-fugitive" },

   -- Highlight colors (CSS hex etc)
   {
      "brenoprata10/nvim-highlight-colors",
      config = function()
         require("nvim-highlight-colors").setup({})
      end,
   },

   -- Web devicons (fallback for non-kitty terminals)
   {
      "nvim-tree/nvim-web-devicons",
      config = function()
         require("nvim-web-devicons").setup({ color_icons = true, default = true })
      end,
   },

   -- Real Icons (VS Code / Material icons rendered as real images in Kitty)
   {
      "Mirsmog/real-icons.nvim",
      build = ":RealIcons install",
      opts = {
         integrations = {
            nvim_tree = true,
            telescope = true,
            lualine = true,
         },
      },
   },
}
