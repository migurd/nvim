require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "go",
        "java",
        "css",
        "html",
        "javascript",
        "typescript",
        "json",
        "tsx",
        "lua",
        "luadoc",
        "rust",
        "sql",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
            },
        },
    },
    autotag = {
        enable = true,
    },
    on_attach = function(client)
        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                underline = true,
                virtual_text = {
                    spacing = 5,
                    severity_limit = 'Warning',
                },
                update_in_insert = true,
            }
        )
    end,
}
