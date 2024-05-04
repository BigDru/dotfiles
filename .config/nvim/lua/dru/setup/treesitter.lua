local M =
{
    "nvim-treesitter/nvim-treesitter",
    dependencies =
    {
        --"nvim-treesitter/nvim-treesitter-textobjects",
        --"p00f/nvim-ts-rainbow",
        "windwp/nvim-ts-autotag",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
}

function M.config()
    require ("nvim-treesitter.configs").setup(
    {
        ensure_installed =
        {
            "awk",
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "css",
            "csv",
            "doxygen",
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
            "markdown_inline",
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
            "yaml"
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {},
        highlight =
        {
            enable = true,
        },
        indent =
        {
            enable = true,
            disable =
            {
                --TODO: make sure these aren't indenting well
                "lua",
                --"c",
                --"cpp",
                --
                -- provide list of strings for parsers that aren't indenting well.
                -- Chris@machine offered "yaml" as an example
            },
        },
        autotag =
        {
            enable = true,
        },
        autopairs = true,
    })
end

return M
