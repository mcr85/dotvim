local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
  return
end

-- local status_ok_null_ls, null_ls = require('null-ls')
-- if not status_ok_null_ls then
--   return
-- end

local null_ls = require 'null-ls'

mason_null_ls.setup();
-- mason_null_ls.setup({
--   ensure_installed = {'stylua', 'eslint_d', 'prettierd', 'black'}
-- });

-- mason_null_ls.setup_handlers {
--   function(source_name)
--     -- all sources with no handler get passed here
--   end,
--   stylua = function(source_name, methods)
--     null_ls.register(null_ls.builtins.formatting.stylua)
--   end,
--   eslint_d = function(source_name, methods)
--     null_ls.register(null_ls.builtins.diagnostics.eslint_d)
--   end,
--   prettierd = function(source_name, methods)
--     null_ls.register(null_ls.builtins.formatting.prettierd)
--   end,
-- }

null_ls.setup();
