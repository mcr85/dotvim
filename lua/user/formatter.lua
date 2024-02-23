-- Credits go to rafamadriz/dotfiles
-- https://github.com/rafamadriz/dotfiles/blob/main/.config/nvim/lua/modules/plugins/formatter.lua

local config = {}

-- TODO: something wrong with this. When wrapped like this, formatter stops working
local function fmt(args)
    return function()
        return args
    end
end

config.prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
    stdin = true,
  }
end

-- npm install -g @fsouza/prettierd
-- run `prettierd start`
config.prettierd = function()
  return {
    exe = "prettierd",
    args = { vim.api.nvim_buf_get_name(0) },
    stdin = true
  }
end

config.eslint = function()
    return {
        exe = "eslint",
        args = {"--stdin","--stdin-filepath", vim.api.nvim_buf_get_name(0), "--fix", "--cache" },
        stdin = true,
    }
end

config.prettierEslint = function()
    return {
        exe = "prettier-eslint",
        args = {"--stdin","--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true,
    }
end

-- M.clang = fmt {
--     exe = "clang-format",
--     args = {
--         "-assume-filename=" .. vim.fn.expand "%:t",
--         [[
--         -style='{IndentWidth: 4, 
--         AlignConsecutiveAssignments: true,
--         AllowShortBlocksOnASingleLine: Empty,
--         AllowShortLoopsOnASingleLine: true,
--         AllowShortIfStatementsOnASingleLine: true,
--         AlignConsecutiveMacros: true,
--         BreakBeforeBraces: Linux,
--         AlignConsecutiveDeclarations: true, 
--         AlwaysBreakAfterReturnType: None}'
--         ]],
--     },
--     stdin = true,
-- }

-- M.stylua = fmt {
--     exe = "stylua",
--     args = { "--search-parent-directories", "--stdin-filepath", '"%:p"', "--", "-" },
--     stdin = true,
-- }

config.sh = fmt {
    exe = "shfmt",
    args = { "-i " .. vim.opt.shiftwidth:get() },
    stdin = true,
}

config.black = fmt {
    exe = "black",
    args = { "--quiet", "-" },
    stdin = true,
}

-- M.goimports = fmt {
--     exe = "goimports",
--     stdin = true,
-- }

-- M.rustfmt = fmt {
--     exe = "rustfmt",
--     args = {
--         string.format(
--             "--config hard_tabs=%s,tab_spaces=%s",
--             not vim.opt.expandtab:get(),
--             vim.opt.shiftwidth:get()
--         ),
--     },
--     stdin = true,
-- }

require("formatter").setup {
  logging = false,
  filetype = {
    -- sh = { config.sh },
    -- c = { M.clang },
    -- cs = { M.clang },
    -- cpp = { M.clang },
    -- lua = { M.stylua },
    -- python = { M.black },
    -- go = { M.goimports },
    -- rust = { M.rustfmt },
    -- css = { config.prettier() },
    -- xml = { config.prettier() },
    -- json = { config.prettier() },
    -- html = { config.prettier() },
    -- scss = { config.prettier() },
    -- markdown = { config.prettier() },
    -- javascript = { M.eslint { "--single-quote" } },
    -- javascript = { config.prettier { "--single-quote" } },
    -- typescript = { M.eslint { "--single-quote" } },
    typescript = { config.prettierd },
    -- javascriptreact = { config.prettier() { "--single-quote" } },
    -- typescriptreact = { config.prettier() { "--single-quote" } },
  },
}

-- require('formatter').setup({
--   filetype = {
--     typescript = {
--       -- prettier
--       function()
--         return {
--           exe = "prettier",
--           args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
--           stdin = true
--         }
--       end
--     },
--   }
-- })
