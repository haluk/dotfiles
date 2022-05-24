local M = {}

M.smart_splits = {
  n = {
    -- Better window navigation
    ["<C-h"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,

      "Move to left split",
    },
    ["<C-j"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,

      "Move to below split",
    },
    ["<C-k"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,

      "Move to above split",
    },
    ["<C-l"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,

      "Move to right split",
    },

    -- Resize with arrows
    ["<C-Up>"] = {
      function()
        require("smart-splits").resize_up()
      end,

      "Resize split up",
    },
    ["<C-Down>"] = {
      function()
        require("smart-splits").resize_right()
      end,

      "Resize split down",
    },
    ["<C-Left>"] = {
      function()
        require("smart-splits").resize_left()
      end,

      "Resize split left",
    },
    ["<C-Right>"] = {
      function()
        require("smart-splits").resize_right()
      end,

      "Resize split right",
    },
  },
}

M.telescope = {
  n = {

    ["<leader>fe"] = {
      "<cmd> Telescope file_browser <CR>", "file browser"
    },

    ["<leader>fp"] = {
      "<cmd> Telescope project <CR>", "project management"
    },
  },
}

return M
