local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

null_ls.setup();

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion

-- null_ls.setup({
	-- debug = false,
	-- sources = {
    -- null_ls.builtins.completion.spell,
    -- null_ls.builtins.diagnostics.spell,
    -- null_ls.builtins.hover.spell,
    -- null_ls.builtins.completion.codespell,
    -- null_ls.builtins.diagnostics.codespell,
    -- null_ls.builtins.hover.codespell,
    -- completion.spell,
		-- formatting.prettier,
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		-- formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.stylua,
		-- diagnostics.flake8
    -- formatting.stylua
	-- }
-- })
