return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      local ts = require("nvim-treesitter")

      -- List of parsers to ensure are installed
      local ensure_installed = {
         "lua", "vim", "vimdoc", "javascript", "typescript",
         "python", "rust", "c", "cpp", "go", "html", "css",
         "json", "yaml", "toml", "bash", "markdown", "zig",
         "nix", "php", "svelte",
      }

      -- Install any missing parsers
      local installed = require("nvim-treesitter.config").get_installed()
      local to_install = vim.tbl_filter(function(lang)
         return not vim.list_contains(installed, lang)
      end, ensure_installed)

      if #to_install > 0 then
         ts.install(to_install)
      end

      -- Treesitter highlight is enabled via autocmd in autocmds.lua
      -- (pcall(vim.treesitter.start, buf) on FileType)
   end,
}
