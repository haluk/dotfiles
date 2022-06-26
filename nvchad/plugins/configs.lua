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
  extensions_list = { "file_browser", "live_grep_args", "media_files", "project", "terms", "themes" },
}

return M
