return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha, dashboard = require("alpha"), require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<cr>"),
      dashboard.button("-", "  > Toggle File Explorer", "<cmd>Oil<cr>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<cr>"),
      dashboard.button("SPC fs", "  > Find String", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session", "<cmd>SessionRestore<cr>"),
      dashboard.button("<esc>", "  > Quit Neovim", "<cmd>qa<cr>"),
    }

    alpha.setup(dashboard.opts)
  end,
}
