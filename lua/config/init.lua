-- lspkind-nvim
require('lspkind').init()

require'lspconfig'.gopls.setup {
  on_attach = function(client)
    -- [[ other on_attach code ]]
    require 'illuminate'.on_attach(client)
  end,
}

-- local on_attach = function(client, bufnr)
--     require 'illuminate'.on_attach(client)

