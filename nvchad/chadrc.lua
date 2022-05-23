local M = {}

local userPlugins = require "custom.plugins"
local pluginConfs = require "custom.plugins.configs"

M.ui = {
   theme = "catppuccin",
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
  },

  user = userPlugins,
}

M.mappings = require "custom.mappings"

return M
