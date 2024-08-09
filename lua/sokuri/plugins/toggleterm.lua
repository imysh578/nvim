return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    keys = {
      {
        "<c-`>",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, nil, "float")
        end,
        desc = "Open first ToggleTerm",
      },
      {
        "<leader>tf",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, nil, "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        "<leader>th",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 25, nil, "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        "<leader>tv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, nil, "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 25
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-`>]],
      on_open = function(term)
        vim.api.nvim_buf_set_keymap(
          term.bufnr,
          "t",
          "<ESC>",
          [[<C-\><C-n>]],
          { noremap = true, silent = true, desc = "Exit insert mode" }
        )
        vim.api.nvim_buf_set_keymap(
          term.bufnr,
          "t",
          "jk",
          [[<C-\><C-n>]],
          { noremap = true, silent = true, desc = "Exit insert mode" }
        )
      end,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
    },
  },
}
