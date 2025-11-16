vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<C-z>", "<C-o>zz")

vim.keymap.set("n", "<leader>w", ":Format<CR>:w<CR>", { silent = true })
vim.keymap.set("n", "<leader>qq", ":qa<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
vim.keymap.set("n", "<leader>BD", ":%bd|e#|bd#<CR>", { silent = true })
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")

vim.keymap.set("n", "<leader>o", "m`o<Esc>``")
vim.keymap.set("n", "<leader>O", "m`O<Esc>``")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "x", "\"_x")
vim.keymap.set("v", "x", "\"_x")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
