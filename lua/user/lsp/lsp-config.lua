local status_ok, lspconfig = pcall(require, 'lspconfig')

if not status_ok then
  return
end

local mason_lspconfig = require('mason-lspconfig')

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- disable virtual text
  virtual_text = false,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local defaultCapabilities = cmp_nvim_lsp.default_capabilities(capabilities)


local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.cmd("command! LspDefinition lua vim.lsp.buf.definition()")
  vim.cmd("command! LspDeclaration lua vim.lsp.buf.declaration()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspReferences lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
  vim.cmd("command! Format lua vim.lsp.buf.format()")
  buf_map(bufnr, "n", "gd", ":LspDefinition<CR>", opts)
  buf_map(bufnr, "n", "gD", ":LspDeclaration<CR>", opts)
  buf_map(bufnr, "n", "ga", ":Lspsaga code_action<CR>", opts)
  buf_map(bufnr, "n", "gr", ":Lspsaga lsp_finder<CR>", opts)
  buf_map(bufnr, "n", "gx", ":LspDiagLine<CR>", opts)
  buf_map(bufnr, "n", "<enter>", ":Lspsaga show_line_diagnostics<CR>", opts)
  buf_map(bufnr, "n", "<F2>", ":Lspsaga rename<CR>", opts)
  buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", opts)
  buf_map(bufnr, "n", "K", ":Lspsaga hover_doc<CR>", opts)
  buf_map(bufnr, "n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
  buf_map(bufnr, "n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)
  buf_map(bufnr, "n", "g=", ":Format<CR>", { noremap = false, silent = true })
  buf_map(bufnr, "n", "<F4>", ":Format<CR>", { noremap = false, silent = true })
  buf_map(bufnr, "n", "<leader>o", ":LSoutlineToggle<CR>", { silent = true })
  -- if client.resolved_capabilities.document_formatting then
  --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  -- end
end

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = defaultCapabilities
    })
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      },
      capabilities = defaultCapabilities,
      on_attach = on_attach
    })
  end,
  ["tsserver"] = function()
    lspconfig.tsserver.setup({
      capabilities = defaultCapabilities,
      on_attach = function(client, bufnr)
        -- client.server_capabilities = defaultCapabilities
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
          eslint_bin = "eslint_d",
          eslint_enable_diagnostics = true,
          eslint_enable_code_actions = true,
          enable_formatting = true,
          formatter = "prettier",
        })
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        -- buf_map(bufnr, "n", "<F2>", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
      end
    })
  end
})

-- require("null-ls").config({
--   debug = false
-- })

-- lspconfig["null-ls"].setup({ on_attach = on_attach })
