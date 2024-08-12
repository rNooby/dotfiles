return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },
  config = function()
    local telescope, actions, builtin, themes, transform_mod =
      require("telescope"),
      require("telescope.actions"),
      require("telescope.builtin"),
      require("telescope.themes"),
      require("telescope.actions.mt").transform_mod

    local trouble, trouble_telescope = require("trouble"), require("trouble.sources.telescope")

    local custom_actions = transform_mod({
      open_trouble_qflist = function()
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown({}),
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    vim.keymap.set("n", "<leader>fb", builtin.oldfiles, { desc = "Fuzzy find recently opened buffers" })
    vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Fuzzy find string under cursor in the cwd" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find file in the cwd" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Fuzzy find string in the cwd" })
    vim.keymap.set("n", "<leader>ft", function()
      local input = vim.fn.input("Todos Keyword: ")
      if input == "" then
        vim.cmd("TodoTelescope")
      else
        vim.cmd("TodoTelescope keywords=" .. string.upper(input))
      end
    end, { desc = "Fuzzy find todos in the cwd" })
  end,
}
