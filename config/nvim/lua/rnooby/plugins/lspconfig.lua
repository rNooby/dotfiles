return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig, mason_lspconfig = require("lspconfig"), require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local icons = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(icons) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.keymap.set(
          "n",
          "<leader>ga",
          vim.lsp.buf.code_action,
          { buffer = ev.buf, desc = "Toggle available code actions", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>gk",
          vim.lsp.buf.hover,
          { buffer = ev.buf, desc = "Show documentation for string under cursor", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>ge",
          "<cmd>LspRestart<cmd>",
          { buffer = ev.buf, desc = "Restart lsp server", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>gd",
          vim.lsp.buf.definition,
          { buffer = ev.buf, desc = "Show lsp definition", silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>gr",
          vim.lsp.buf.references,
          { buffer = ev.buf, desc = "Show lsp references", silent = true }
        )
        vim.keymap.set(
          "n",
          "]d",
          vim.diagnostic.goto_next,
          { buffer = ev.buf, desc = "Jump to next diagnostic", silent = true }
        )
        vim.keymap.set(
          "n",
          "[d",
          vim.diagnostic.goto_prev,
          { buffer = ev.buf, desc = "Jump to previous diagnostic", silent = true }
        )
      end,
    })

    mason_lspconfig.setup_handlers({
      function(server)
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completions = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
