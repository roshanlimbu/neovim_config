--vim.cmd"colorscheme gruvbox"

local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) --pcall means protected call
-- .. means concat
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
