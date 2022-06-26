return {
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  ["mrjones2014/smart-splits.nvim"] = {
    config = function()
      local smart_splits = require "smart-splits"
      smart_splits.setup {
        -- Ignored filetypes (only while resizing)
        ignored_filetypes = {
          "nofile",
          "quickfix",
          "prompt",
        },
        -- Ignored buffer types (only while resizing)
        ignored_buftypes = { "NvimTree" },
        -- when moving cursor between splits left or right,
        -- place the cursor on the same row of the *screen*
        -- regardless of line numbers. False by default.
        -- Can be overridden via function parameter, see Usage.
        move_cursor_same_row = false,
      }
    end,
  },

  ["declancm/cinnamon.nvim"] = {
    config = function()
      require("cinnamon").setup()
    end,
  },

  ["fedepujol/move.nvim"] = {},

  -- Telescope
  ["nvim-telescope/telescope-file-browser.nvim"] = {},
  ["nvim-telescope/telescope-project.nvim"] = {},
  ["nvim-telescope/telescope-live-grep-args.nvim"] = {},
  ["nvim-telescope/telescope-media-files.nvim"] = {},

  -- LSP
  ["ray-x/navigator.lua"] = {
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },

    config = function()
      require("navigator").setup {
        debug = true,
        lsp_installer = true,
        keymaps = { { key = 'gR', func = "require('navigator.reference').async_ref()" } },
      }
    end,
  },

  ["liuchengxu/vista.vim"] = {},

  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.null-ls".setup()
    end,
    --   config = function()
    --     require("null-ls").setup({
    --       sources = {
    --         require("null-ls").builtins.formatting.stylua,
    --         require("null-ls").builtins.diagnostics.eslint,
    --         require("null-ls").builtins.completion.spell,
    --       },
    --     })
    --   end,
  },

  ["max397574/better-escape.nvim"] = {
    config = function()
      require("better_escape").setup()
    end,
  },

  ["andymass/vim-matchup"] = {
    event = "BufWinEnter",
  }

}
