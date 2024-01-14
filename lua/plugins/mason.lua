return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "lua-language-server",
            "clangd",
            "typescript-language-server",
            "pyright",
        },
    },
    config = true,
}
