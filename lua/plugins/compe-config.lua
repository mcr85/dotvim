local cmp = require 'cmp'
local lspkind = require 'lspkind'
local types = require 'cmp.types'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- ['<Tab>'] = cmp.mapping.select_next_item(),
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Esc>'] = cmp.mapping.close();
    -- ['<CR>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true,
    -- })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
    { name = 'path' },
    { name = 'spell' },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  },
  preselect = types.cmp.PreselectMode.None
})

-- Setup lspconfig.
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

-- omnisharp lsp config
-- require'lspconfig'.omnisharp.setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   on_attach = function(_, bufnr)
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   end,
--   cmd = { "/path/to/omnisharp-roslyn/bin/omnisharp/run", "--languageserver" , "--hostPID", tostring(pid) },
-- }

-- for _, server in ipairs({"typescript", "angular", "html", "json", "lua"}) do
--   require('lspconfig')[server].setup {
--     -- on_attach = on_attach,
--     -- flags = {
--     --   debounce_text_changes = 150
--     -- },
--     capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--   }
-- end
