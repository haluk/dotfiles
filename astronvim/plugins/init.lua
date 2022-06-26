return {
  -- Disable default plugins
  -- ["declancm/cinnamon.nvim"] = { disable = true },

  -- Colorscheme/theme
  ["catppuccin/nvim"] = {
    config = function()
      require("catppuccin").setup {}
    end,
  },

  -- Font for icons
  ["yamatsum/nvim-nonicons"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
  },

  -- Highlight, navigate, and operate on sets of matching text
  ["andymass/vim-matchup"] = {
    after = "nvim-treesitter",
  },

  -- Markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"](0)
    end,
    ft = {
      "markdown",
    },
  },

  -- Reopen files at last edit position
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
    end,
  },

  -- Distraction-free coding
  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    module = "zen-mode",
    config = function()
      require("zen-mode").setup(require "user.plugins.zen-mode")
    end,
  },

  -- nvim-cmp source for emoji
  ["hrsh7th/cmp-emoji"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "emoji"
    end,
  },

  -- Plain text note-taking assistant
  ["mickael-menu/zk-nvim"] = {
    module = { "zk", "zk.commands" },
    config = function()
      require("zk").setup(require "user.plugins.zk")
    end,
  },

  -- Extensions for telescope.nvim
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },
  ["nvim-telescope/telescope-hop.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "hop"
    end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.project",
    config = function()
      require("telescope").load_extension "project"
    end,
  },
  ["nvim-telescope/telescope-live-grep-args.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.live_grep_args",
    config = function()
      require("telescope").load_extension "live_grep_args"
    end,
  },
  ["benfowler/telescope-luasnip.nvim"] = {
    after = "telescope.nvim",
    module = "telescope._extensions.luasnip",
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },

  -- Navigate around your document
  -- Move / Swap elements around
  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },

  -- Resolve merge conflicts
  ["akinsho/git-conflict.nvim"] = {
    config = function()
      require("git-conflict").setup(require "user.plugins.git-conflict")
    end,
  },

  -- Programming, Testing, Debugging
  -- sqls language server
  ["nanotee/sqls.nvim"] = { module = "sqls" },

  -- Better quickfix window
  ["kevinhwang91/nvim-bqf"] = {
    ft = "qf",
    config = function()
      require("bqf").setup()
    end,
  },

  ["lewis6991/spaceless.nvim"] = {
    event = "BufEnter",
    config = function()
      require("spaceless").setup()
    end,
  },
}
