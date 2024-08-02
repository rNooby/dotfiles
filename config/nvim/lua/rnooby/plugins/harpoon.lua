return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    vim.keymap.set("n", "<C-a>", function()
      harpoon:list():add()
    end, { desc = "Add current buffer to harpoon" })
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle harpoon quick menu" })

    vim.keymap.set("n", "<A-1>", function()
      harpoon:list():select(1)
    end, { desc = "Jump to harpoon buffer 1" })
    vim.keymap.set("n", "<A-2>", function()
      harpoon:list():select(2)
    end, { desc = "Jump to harpoon buffer 2" })
    vim.keymap.set("n", "<A-3>", function()
      harpoon:list():select(3)
    end, { desc = "Jump to harpoon buffer 3" })
    vim.keymap.set("n", "<A-4>", function()
      harpoon:list():select(4)
    end, { desc = "Jump to harpoon buffer 4" })

    vim.keymap.set("n", "<A-j>", function()
      harpoon:list():prev()
    end, { desc = "Jump to harpoon previous buffer" })
    vim.keymap.set("n", "<A-k>", function()
      harpoon:list():next()
    end, { desc = "Jump to harpoon next buffer" })
  end,
}
