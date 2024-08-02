return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      format_on_save = {
        async = false,
        lsp_fallback = true,
        timeout = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fv", function()
      conform.format({
        async = false,
        lsp_fallfack = true,
        timeout = 1000,
      })
    end, { desc = "Format current buffer or range" })
  end,
}
