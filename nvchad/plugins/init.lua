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

   -- ["mg979/vim-visual-multi"] = {
   --   -- event = { "BufRead", "BufNewFile" },
   --   config = function()
   --     -- Visual Multi plugin key mappings.
   --     vim.g.VM_theme = "codedark"
   --     vim.g.VM_maps = {
   --       ["Find Under"] = "<C-d>",
   --       ["Find Subword Under"] = "<C-d>",
   --     }
   --   end,
   -- },

 }
