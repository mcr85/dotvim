local status_ok, diffview = pcall(require, "nvim-autopairs")

if not status_ok then
  return
end

diffview.setup();
