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
      "<cmd> Telescope file_browser <CR>", "  file browser"
    },

    ["<leader>fp"] = {
      "<cmd> Telescope project <CR>", "  project management"
    },

    ["<leader>fr"] = {
      "<cmd> Telescope live_grep_args <CR>", "  live grep args"
    },

    ["<leader>fw"] = {
      "<cmd> Telescope live_grep <CR> ", "  live grep"
    },

    ["<leader>fo"] = {
      "<cmd> Telescope oldfiles <CR>", "  find oldfiles"
    },

  },
}

M.move = {
  n = {
    ["<A-j>"] = {
      "<cmd> MoveLine(1) <CR>", "Move line down"
    },
    ["<A-k>"] = {
      "<cmd> MoveLine(-1) <CR>", "Move line up"
    },
    ["<A-l>"] = {
      "<cmd> MoveHChar(1) <CR>", "Move char right"
    },
    ["<A-h>"] = {
      "<cmd> MoveHChar(-1) <CR>", "Move char left"
    },
  },
  v = {
    ["<A-j>"] = {
      "<cmd> MoveBlock(1) <CR>", "Move block down"
    },
    ["<A-k>"] = {
      "<cmd> MoveBlock(-1) <CR>", "Move block up"
    },
    ["<A-l>"] = {
      "<cmd> MoveHBlock(1) <CR>", "Move chars right"
    },
    ["<A-h>"] = {
      "<cmd> MoveHBlock(-1) <CR>", "Move chars left"
    },
  },

}

return M
