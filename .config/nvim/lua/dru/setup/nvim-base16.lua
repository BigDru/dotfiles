local colorscheme = "base16-seti"
--local colorscheme = "base16-everforest"
--local colorscheme = "base16-tomorrow-night"
--local colorscheme = "base16-synth-midnight-dark"

vim.cmd('colorscheme base16-seti')
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
