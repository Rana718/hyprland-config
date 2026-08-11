return {
   "folke/noice.nvim",
   event = "VeryLazy",
   dependencies = {
      "MunifTanjim/nui.nvim",
   },
   opts = {
      cmdline = {
         enabled = true,
         view = "cmdline_popup", -- floating centered popup like LazyVim
         format = {
            cmdline     = { icon = ">" },
            search_down = { icon = ">" },
            search_up   = { icon = ">" },
            filter      = { icon = "$" },
            lua         = { icon = "☾" },
            help        = { icon = "?" },
         },
      },
      messages = {
         enabled = true,
         view = "notify",
         view_error = "notify",
         view_warn = "notify",
      },
      popupmenu = {
         enabled = true,
         backend = "nui",
      },
      notify = {
         enabled = true,
         view = "notify",
      },
      lsp = {
         override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
         },
         progress = {
            enabled = true,
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            throttle = 1000 / 30,
            view = "mini",
         },
      },
      presets = {
         bottom_search = false,  -- search in center popup like commands
         command_palette = true, -- position cmdline + popupmenu together
         long_message_to_split = true,
         inc_rename = false,
         lsp_doc_border = true,
      },
   },
}
