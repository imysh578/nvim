vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "JK", "<ESC>", { desc = "Exit insert mode with JK" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<C-+>", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<C-_>", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sw", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tw", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tj", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tk", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- text management
keymap.set("n", "<C-A>", "ggVG", { desc = "Select All text in the current file" })
keymap.set("n", "<leader>rr", ":%s//g<Left><Left>", { desc = "Find and Replace text in the current file" })

-- TODO: Doesn't work in normal mode. These keymaps are conflicted with TmuxNavigation
keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line up(n)" }) -- move line up(n)
keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line down(n)" }) -- move line down(n)
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up(v)" }) -- move line up(v)
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down(v)" }) -- move line down(v)
