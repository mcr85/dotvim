local status_ok, scrollbar = pcall(require, 'scrollbar')
if not status_ok then
  return
end

local colors = require('gruvbox-baby.colors').config()


scrollbar.setup({
  marks = {
    Search = { color = colors.soft_yellow }
  },
  excluded_types = {
    "prompt",
    "TelescopePrompt"
  }
});

require('scrollbar.handlers.search').setup()
