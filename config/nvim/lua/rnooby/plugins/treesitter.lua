return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "lua", "markdown", "markdown_inline", "python", "vimdoc" },

      auto_install = true,
      sync_install = false,

      highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },

      ignore_install = {},
      indent = { enable = true },
      modules = {},
    })
  end,
}
