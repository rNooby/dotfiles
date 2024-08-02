return {
  "akinsho/toggleterm.nvim",
  config = function()
    local palette = require("catppuccin.palettes").get_palette("mocha")
    require("toggleterm").setup({
      open_mapping = "<C-\\>",
      highlights = {
        Normal = {
          guibg = palette.base,
        },
      },
    })
  end,
}
