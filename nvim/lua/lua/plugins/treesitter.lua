return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   config = function()
      -- In Neovim 0.12+, treesitter is built-in.
      -- nvim-treesitter is only used for :TSInstall convenience.
      -- Use the new opts-based setup if available, otherwise skip.
      local ok, ts = pcall(require, "nvim-treesitter")
      if ok and ts.setup then
         ts.setup({
            ensure_installed = {
               "lua", "vim", "vimdoc", "javascript", "typescript",
               "python", "rust", "c", "cpp", "go", "html", "css",
               "json", "yaml", "toml", "bash", "markdown", "zig",
               "nix", "php",
            },
         })
      end

      -- Treesitter highlight is enabled via autocmd in autocmds.lua
      -- (pcall(vim.treesitter.start, buf) on FileType)
   end,
}
