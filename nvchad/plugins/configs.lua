local M = {}

M.treesitter = {
  ensure_installed = {
    "css",
    "scss",
    "html",
    "javascript",
    "python",
    "lua",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
}

M.telescope = {
  extensions_list = { "file_browser", "project", "live_grep_args" },
}

return M
