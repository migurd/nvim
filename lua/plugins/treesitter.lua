return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "c",
            "c_sharp",
            "cpp",
            "css",
            "go",
            "html",
            "java",
            "javascript",
            "lua",
            "luadoc",
            "rust",
            "sql",
            "typescript",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
}
