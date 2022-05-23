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

return M
