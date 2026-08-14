return {
   "nvim-tree/nvim-tree.lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("nvim-tree").setup({
         auto_reload_on_write = true,
         view = {
            width = 30,
            side = "left",
            signcolumn = "no",
         },
         filesystem_watchers = {
            enable = true,
            debounce_delay = 100,
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
                  git = {
                     unstaged = "",
                     staged = "",
                     unmerged = "",
                     renamed = "➜",
                     untracked = "★",
                     deleted = "",
                     ignored = "◌",
                  },
               },
            },
            indent_markers = { enable = true },
            -- Highlight files by git status (like VS Code)
            highlight_git = "name",
            highlight_opened_files = "name",
         },
         filters = { dotfiles = false },
         git = { enable = true, ignore = false },
         diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
               hint = "",
               info = "",
               warning = "",
               error = "",
            },
         },
      })

      -- VS Code-like git colors for nvim-tree file names
      vim.api.nvim_set_hl(0, "NvimTreeGitDirtyIcon", { fg = "#e2c08d" })    -- modified (yellow)
      vim.api.nvim_set_hl(0, "NvimTreeGitStagedIcon", { fg = "#73c991" })   -- staged (green)
      vim.api.nvim_set_hl(0, "NvimTreeGitNewIcon", { fg = "#73c991" })      -- new/untracked (green)
      vim.api.nvim_set_hl(0, "NvimTreeGitDeletedIcon", { fg = "#f14c4c" })  -- deleted (red)
      vim.api.nvim_set_hl(0, "NvimTreeGitMergeIcon", { fg = "#e2c08d" })    -- merge conflict (yellow)
      vim.api.nvim_set_hl(0, "NvimTreeGitRenamedIcon", { fg = "#73c991" })  -- renamed (green)
      vim.api.nvim_set_hl(0, "NvimTreeGitIgnoredIcon", { fg = "#6e6e6e" })  -- ignored (gray)

      -- File name highlights based on git status
      vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL", { fg = "#e2c08d" })   -- modified file name (yellow)
      vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL", { fg = "#73c991" })     -- untracked file name (green)
      vim.api.nvim_set_hl(0, "NvimTreeGitFileStagedHL", { fg = "#73c991" })  -- staged file name (green)
      vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL", { fg = "#f14c4c" }) -- deleted file name (red)
      vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL", { fg = "#6e6e6e" }) -- ignored file name (gray)
      vim.api.nvim_set_hl(0, "NvimTreeGitFileMergeHL", { fg = "#e2c08d" })   -- conflict file name (yellow)
      vim.api.nvim_set_hl(0, "NvimTreeGitFileRenamedHL", { fg = "#73c991" }) -- renamed file name (green)
   end,
}
