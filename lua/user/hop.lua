local status_ok, hop = pcall(require, 'hop')
if not status_ok then
  return
end

local map = vim.api.nvim_set_keymap;

hop.setup();

map('n', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
map('n', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
