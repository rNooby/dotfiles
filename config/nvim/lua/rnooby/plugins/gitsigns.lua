return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      vim.keymap.set("n", "]h", gitsigns.next_hunk, { buffer = bufnr, desc = "Jump to next gitsigns hunk" })
      vim.keymap.set("n", "[h", gitsigns.prev_hunk, { buffer = bufnr, desc = "Jump to previous gitsigns hunk" })

      vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage gitsigns hunk" })
      vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset gitsigns hunk" })
      vim.keymap.set("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { buffer = bufnr, desc = "Stage gitsigns hunk" })
      vim.keymap.set("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { buffer = bufnr, desc = "Reset gitsigns hunk" })

      vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage gitsigns buffer" })
      vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset gitsigns buffer" })

      vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo gitsigns stage hunk" })
      vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview gitsigns hunk" })

      vim.keymap.set("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, { buffer = bufnr, desc = "Blame gitsign line" })
      vim.keymap.set(
        "n",
        "<leader>hB",
        gitsigns.toggle_current_line_blame,
        { buffer = bufnr, desc = "Toggle gitsigns line blame" }
      )

      vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { buffer = bufnr, desc = "Diff this against the index" })
      vim.keymap.set("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end, { buffer = bufnr, desc = "Diff this against the '~'" })

      vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select gitsigns hunk" })
    end,
  },
}
