local M = {}

local userPlugins = require "custom.plugins"
local pluginConfs = require "custom.plugins.configs"
local userHighlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  hl_override = userHighlights,
}

M.plugins = {

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },

  },

  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
  },

  user = userPlugins,
}

M.mappings = require "custom.mappings"

return M
