return {
  "epwalsh/obsidian.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  version = "*",
  lazy = true,
  ft = "markdown",
  config = function()
    local vaultsPath = os.getenv("HOME") .. "/Documents/Obsidian/"

    require("obsidian").setup({
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      workspaces = {
        {
          name = "Personal",
          path = vaultsPath .. "Personal",
        },
        {
          name = "Work",
          path = vaultsPath .. "Work",
        },
      },
    })

    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open a obsidian note" })
    vim.keymap.set("n", "<leader>oz", "<cmd>ObsidianNew<cr>", { desc = "Open a new obsidian note" })
    vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search obsidian notes" })
  end,
}
