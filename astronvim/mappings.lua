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
