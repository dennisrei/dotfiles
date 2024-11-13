-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i", "x", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol, { desc = "Document Symbol" })
vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbol" })
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { desc = "Codelens Run" })
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostic" })

-- Buffer
vim.keymap.set("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go To Buffer 1" })
vim.keymap.set("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go To Buffer 2" })
vim.keymap.set("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go To Buffer 3" })
vim.keymap.set("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go To Buffer 4" })
vim.keymap.set("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go To Buffer 5" })
vim.keymap.set("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go To Buffer 6" })
vim.keymap.set("n", "<leader>q", LazyVim.ui.bufremove, { desc = "Close Buffer" })
