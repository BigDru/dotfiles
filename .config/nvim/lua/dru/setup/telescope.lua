local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    print("Telescope require failed")
    return
end

telescope.setup()

telescope.load_extension("fzy_native")
