return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = { "icon" },
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["\\"] = "actions.select_vsplit",
        ["|"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-q>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-w"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["~"] = "actions.cd",
        ["s"] = "actions.change_sort",
        ["x"] = "actions.open_external",
        ["."] = "actions.toggle_hidden",
        ["<C-.>"] = "actions.toggle_trash",
      },
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },

      delete_to_trash = true,
      default_file_explorer = true,
      use_default_keymaps = false,
      skip_confirm_for_simple_edits = true,
    })

    vim.keymap.set("n", "-", oil.open, { desc = "Toggle file explorer" })
  end,
}
