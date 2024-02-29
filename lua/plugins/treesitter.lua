return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
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
            "typescript",
            "json",
            "tsx",
            "lua",
            "luadoc",
            "rust",
            "sql",
        },
        indent = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer", -- op keymaps for visual mode, made to select text inside fn, conditional and loop
                    ["if"] = "@function.inner",
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                }
            }
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
    },
    config = function()
        require "angelq.treesitter"
    end
}
