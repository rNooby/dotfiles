vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set("n", "<esc>", ":noh<cr><esc>", { desc = "Clear last highlight search", silent = true })

vim.keymap.set(
  "n",
  "<leader>fr",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace string under the cursor" }
)

vim.keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<cr>", { desc = "Make current buffer executable", silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous match" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up one page" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down one page" })

vim.keymap.set("n", "+", "<C-a>", { desc = "Increase number value" })
vim.keymap.set("n", "_", "<C-x>", { desc = "Decrease number value" })

vim.keymap.set("n", "|", "<C-w>v", { desc = "Split window horizontally" })
vim.keymap.set("n", "\\", "<C-w>s", { desc = "Split window vertically" })
vim.keymap.set("n", "<C-x>", "<cmd>close<cr>", { desc = "Close current window" })

vim.keymap.set("n", "<S-Left>", "<C-w>h", { desc = "Jump to left window" })
vim.keymap.set("n", "<S-Down>", "<C-w>j", { desc = "Jump to bottom window" })
vim.keymap.set("n", "<S-Up>", "<C-w>k", { desc = "Jump to upper window" })
vim.keymap.set("n", "<S-Right>", "<C-w>l", { desc = "Jump to right window" })

vim.keymap.set("n", "<leader>qf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
vim.keymap.set("n", "<leader>qx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>qz", "<cmd>tabnew<cr>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>q<Left>", "<cmd>tabn<cr>", { desc = "Jump to next tab" })
vim.keymap.set("n", "<leader>q<Right>", "<cmd>tabp<cr>", { desc = "Jump to previous tab" })

vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { desc = "Move highlighted lines up", silent = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { desc = "Move highlighted lines down", silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "t",
      "<C-esc>",
      [[<C-\><C-n>]],
      { desc = "Exit terminal mode", noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      "t",
      "<S-Up>",
      [[<C-\><C-n><C-W>k]],
      { desc = "Jump to upper window", noremap = true, silent = true }
    )
  end,
})
