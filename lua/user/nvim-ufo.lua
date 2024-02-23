local status_ok, nvim_ufo = pcall(require, "ufo")
if not status_ok then
  return
end

-- nvim_ufo.setup({
--   provider_selector = function(bufnr, filetype, buftype)
--     return { 'lsp', 'treesitter' }
--   end
-- })

-- local function selectProviderWithChainByDefault()
  local ftMap = {
    vim = 'indent',
    python = {'indent'},
    git = ''
  }

  local function customizeSelector(bufnr)
    local function handleFallbackException(err, providerName)
      if type(err) == 'string' and err:match('UfoFallbackException') then
        return require('ufo').getFolds(providerName, bufnr)
      else
        return require('promise').reject(err)
      end
    end

    return require('ufo').getFolds('lsp', bufnr):catch(function(err)
      return handleFallbackException(err, 'treesitter')
    end):catch(function(err)
      return handleFallbackException(err, 'indent')
    end)
  end

  nvim_ufo.setup({
    open_fold_hl_timeout = 0,
    provider_selector = function(bufnr, filetype, buftype)
      return ftMap[filetype] or customizeSelector
    end
  })
-- end

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", nvim_ufo.openAllFolds)
vim.keymap.set("n", "zM", nvim_ufo.closeAllFolds)

