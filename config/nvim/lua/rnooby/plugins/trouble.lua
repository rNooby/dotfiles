return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle trouble diagnostics list" },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Toggle trouble buffer diagnostics list",
    },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Toggle trouble quickfix list" },
    { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Toggle trouble location list" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Toggle todos in trouble" },
  },
}
