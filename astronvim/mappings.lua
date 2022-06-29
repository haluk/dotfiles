local map = vim.keymap.set

-- Telescope
map("n", "<leader>fp", function()
  require("telescope").extensions.project.project {}
end, { desc = " Project management"})

map("n", "<leader>fr", function()
  require("telescope").extensions.live_grep_args.live_grep_args {}
end, { desc = " Search words args" })

map("n", "<leader>fe", function()
  require("telescope").extensions.file_browser.file_browser {}
end, { desc = " File browser" })


-- Move lines
map("n", "<A-j>", "<cmd> MoveLine(1) <CR>", { desc = "Move line down" })
map("n", "<A-k>", "<cmd> MoveLine(-1) <CR>", { desc = "Move line up" })
map("n", "<A-l", "<cmd> MoveHChar(1) <CR>", { desc = "Move char right" })
map("n", "<A-h", "<cmd> MoveHChar(-1) <CR>", { desc = "Move char left" })
map("v", "<A-j>", "<cmd> MoveBlock(1) <CR>", { desc = "Move line down" })
map("v", "<A-k>", "<cmd> MoveBlock(-1) <CR>", { desc = "Move line up" })
map("v", "<A-l", "<cmd> MoveHBlock(1) <CR>", { desc = "Move char right" })
map("v", "<A-h", "<cmd> MoveHBlock(-1) <CR>", { desc = "Move char left" })

-- formatting
map("v", "<leader>lF", "<ESC><cmd>lua vim.lsp.buf.range_formatting() <CR>")
