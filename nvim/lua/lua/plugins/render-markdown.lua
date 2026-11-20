return {
   {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons",
      },
      ft = { "markdown" }, -- only load for markdown files
      config = function()
         require("render-markdown").setup({
            enabled = false, -- start disabled; toggle with Ctrl+Shift+M
            render_modes = { "n", "c" },
            heading = {
               enabled = true,
               sign = true,
               icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            },
            code = {
               enabled = true,
               sign = false,
               style = "full",
               border = "thin",
            },
            bullet = { enabled = true },
            checkbox = { enabled = true },
            table = { enabled = true },
            link = { enabled = true },
         })

         -- Toggle keymap: only active when buffer is markdown
         vim.keymap.set("n", "<C-S-m>", function()
            local ft = vim.bo.filetype
            if ft ~= "markdown" then
               vim.notify("Not a Markdown file", vim.log.levels.WARN)
               return
            end
            require("render-markdown").toggle()
         end, { desc = "Toggle Markdown render" })
      end,
   },
}
