local status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lsp_config.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "lua_ls"
    -- "sumneko_lua"
  }
})

-- mason_lsp_config.setup_handlers({
--   function
--
-- })

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
--   }
--
--   if server.name == "jsonls" then
--     local jsonls_opts = require("user.lsp.settings.jsonls")
--     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--   end
--
--   if server.name == "sumneko_lua" then
--     local sumneko_opts = require("user.lsp.settings.sumneko_lua")
--     opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--   end
--
--   -- This setup() function is exactly the same as lspconfig's setup function.
--   -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--   server:setup(opts)
-- end)
