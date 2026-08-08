return {
   "folke/tokyonight.nvim",
   priority = 1000,
   config = function()
      require("tokyonight").setup({
         style = "night",
         transparent = true,
         styles = {
            sidebars = "transparent",
            floats = "transparent",
         },
      })
      vim.cmd.colorscheme("tokyonight")
      -- Full transparency (tonybanters style)
      vim.cmd("hi Directory guibg=NONE")
      vim.cmd("hi SignColumn guibg=NONE")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
   end,
}
