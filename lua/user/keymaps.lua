local opts ={ noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("t", "<C-h>", "<C-w>h", opts)
keymap("t", "<C-j>", "<C-w>j", opts)
keymap("t", "<C-k>", "<C-w>k", opts)
keymap("t", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>i", "<cmd>:Telescope lsp_workspace_symbols<cr>", opts);
keymap("n", "<leader>o", "<cmd>:Telescope lsp_document_symbols<cr>", opts);

keymap("n", "<leader>g", "<cmd>:Git<CR>", opts)

