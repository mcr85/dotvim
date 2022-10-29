local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require('user.lsp.mason')
require('user.lsp.null-ls')
require('user.lsp.mason-lspconfig')
require('user.lsp.mason-null-ls')
require('user.lsp.lsp-config')
require('user.lsp.handlers').setup()
require('user.lsp.lsp-kind')
-- TODO: fix this
--require('user.lsp.lspsaga')
