local M =
{
    "nvim-treesitter/nvim-treesitter",
    dependencies =
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "p00f/nvim-ts-rainbow",
    }
}

function M.config()
    require ("nvim-treesitter.configs").setup
    {
        ensure_installed = {
            "awk",
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "css",
            "csv",
            "doxygen",
            "fsh",
            "html",
            "java",
            "javascript",
            "jq",
            "json",
            "json5",
            "latex",
            "lua",
            "luadoc",
            "make",
            "markdown",
            "norg",
            "objc",
            "objdump",
            "php",
            "python",
            "regex",
            "sql",
            "ssh_config",
            "strace",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml" },
        sync_install = false,
        auto_install = false,
        ignore_install = { "" },
        highlight =
        {
            enable = true,
            disable = { "" },
            additional_vim_regex_highlighting = true,
        },
        indent =
        {
            enable = true,
            disable =
            {
                "lua",
                "c",
                "cpp",
                -- provide list of strings for parsers that aren't indenting well.
                -- Chris@machine offered "yaml" as an example
            },
        },
        rainbow =
        {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
        autopairs =
        {
            enable = true,
        },
    }
end

return M
