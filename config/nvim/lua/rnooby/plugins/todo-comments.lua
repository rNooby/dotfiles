return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    todo_comments.setup({
      keywords = {
        FIX = { icon = " ", color = "#f38ba8", alt = { "BUG", "ERROR", "ISSUE", "FIXIT", "FIXME" } },
        TODO = { icon = " ", color = "#74c7ec" },
        HACK = { icon = " ", color = "#fab387" },
        WARN = { icon = " ", color = "#f9e2af", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", color = "#cba6f7", alt = { "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "#a6e3a1", alt = { "INFO" } },
        TEST = { icon = " ", color = "#f2cdcd", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    })

    vim.keymap.set("n", "]a", function()
      todo_comments.jump_next()
    end, { desc = "Jump to next todo" })

    vim.keymap.set("n", "[a", function()
      todo_comments.jump_prev()
    end, { desc = "Jump to previous todo" })
  end,
}
