return {
   "3rd/image.nvim",
   event = "BufEnter",
   ft = { "png", "jpg", "jpeg", "gif", "webp", "svg", "bmp" },
   opts = {
      backend = "kitty",
      integrations = {
         markdown = { enabled = true },
         neorg = { enabled = false },
         typst = { enabled = false },
         html = { enabled = false },
         css = { enabled = false },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = 80,
      max_height_window_percentage = 80,
      window_overlap_clear_enabled = true,
      editor_only_render_when_focused = true,
      tmux_show_only_in_active_window = true,
      hijack_file_patterns = {
         "*.png", "*.jpg", "*.jpeg",
         "*.gif", "*.webp", "*.svg", "*.bmp",
      },
   },
}
