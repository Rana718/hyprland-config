return {
   "windwp/nvim-autopairs",
   event = "InsertEnter",
   config = function()
      require("nvim-autopairs").setup({
         check_ts = true,
         ts_config = {
            lua = { "string" },
            javascript = { "template_string" },
         },
      })
      -- Integration with nvim-cmp
      local cmp_ok, cmp = pcall(require, "cmp")
      if cmp_ok then
         local autopairs_cmp = require("nvim-autopairs.completion.cmp")
         cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
      end
   end,
}
