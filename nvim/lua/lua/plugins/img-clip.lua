return {
   "HakonHarnes/img-clip.nvim",
   event = "VeryLazy",
   opts = {
      default = {
         embed_image_as_base64 = false,
         prompt_for_file_name = true,
         drag_and_drop = {
            insert_mode = true,
         },
      },
      filetypes = {
         markdown = {
            url_encode_path = true,
            template = "![$CURSOR]($FILE_PATH)",
         },
         html = {
            template = '<img src="$FILE_PATH" alt="$CURSOR">',
         },
      },
   },
   keys = {
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
   },
}
