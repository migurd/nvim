return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim"
    },
    config = function() -- LSP
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

            -- Use the on_attach function for other client-specific configurations
            if client.resolved_capabilities.document_formatting then
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.formatting()
                end, opts)
            end
        end

        -- Setup language servers.
        local nvim_lsp = require("lspconfig")

        -- Language servers configurations
        local servers = {
            -- HTML language server
            html = {
                filetypes = { "html", "htmldjango", "ejs" },
                init_options = {
                    configurationSection = { "html", "css", "javascript" },
                    embeddedLanguages = {
                        css = true,
                        javascript = true
                    }
                },
                root_dir = function(fname)
                    return nvim_lsp.util.find_git_ancestor(fname) or nvim_lsp.util.path.dirname(fname)
                end,
                settings = {}
            }, 
            -- JavaScript language server (for JavaScript and TypeScript files)
            tsserver = {
                filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "html" },
                root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
            },
            -- CSS language server
            cssls = {
                filetypes = { "css", "scss", "less", "html" },
                root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),
            },
            -- EMMET
            emmet_language_server = {
                filetypes = { "html", "htmldjango", "ejs" },
                init_options = {
                    configurationSection = { "html", "css", "javascript" },
                    embeddedLanguages = {
                        css = true,
                        javascript = true
                    }
                },
                root_dir = function(fname)
                    return nvim_lsp.util.find_git_ancestor(fname) or nvim_lsp.util.path.dirname(fname)
                end,
                settings = {}
            },
            -- FLUTTER
            dartls = {},
        }

        -- Loop through the servers table and set up each language server
        for lsp, config in pairs(servers) do
            nvim_lsp[lsp].setup {
                on_attach = on_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
                flags = {
                    debounce_text_changes = 150,
                },
                settings = config.settings,
                init_options = config.init_options,
                filetypes = config.filetypes,
                root_dir = config.root_dir,
            }
        end
    end
}
