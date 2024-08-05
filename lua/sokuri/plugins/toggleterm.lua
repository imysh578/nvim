return {
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = { "ToggleTerm" },
    keys = {
      {
        "<leader>Tf",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, nil, "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        "<leader>Thh",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 15, nil, "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        "<leader>Tvv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, nil, "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        "<leader>Th1",
        function()
          require("toggleterm").toggle(1, 15, nil, "horizontal")
        end,
        desc = "ToggleTerm 1 (horizontal)",
      },
      {
        "<leader>Th2",
        function()
          require("toggleterm").toggle(2, 15, nil, "horizontal")
        end,
        desc = "ToggleTerm 2 (horizontal)",
      },
      {
        "<leader>Th3",
        function()
          require("toggleterm").toggle(3, 15, nil, "horizontal")
        end,
        desc = "ToggleTerm 3 (horizontal)",
      },
      {
        "<leader>Tv1",
        function()
          require("toggleterm").toggle(1, vim.o.columns * 0.4, nil, "vertical")
        end,
        desc = "ToggleTerm 1 (vertical)",
      },
      {
        "<leader>Tv2",
        function()
          require("toggleterm").toggle(2, vim.o.columns * 0.4, nil, "vertical")
        end,
        desc = "ToggleTerm 2 (vertical)",
      },
      {
        "<leader>Tv3",
        function()
          require("toggleterm").toggle(3, vim.o.columns * 0.4, nil, "vertical")
        end,
        desc = "ToggleTerm 3 (vertical)",
      },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
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
      direction = "horizontal",
      close_on_exit = true,
    },
  },
}
