local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    print("Telescope require failed")
    return
end

telescope.setup({
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(opts)
                return {"--hidden"}
            end
        },
    },
})

telescope.load_extension("fzy_native")
