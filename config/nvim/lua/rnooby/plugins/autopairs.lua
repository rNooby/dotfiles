return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
      },
    })

    local cmp, cmp_autopairs = require("cmp"), require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
