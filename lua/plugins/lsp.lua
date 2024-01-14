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

        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})

            -- Additional diagnostics handler with delay for updates
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    update_in_insert = true,
                }
            )

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
                buf_set_keymap('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end
        end

        -- Setup language servers.
        local lspconfig = require'lspconfig'
        lspconfig.clangd.setup({
            on_attach = on_attach,
        })
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
        })
        lspconfig.tsserver.setup{
            on_attach = on_attach,
        }
        lspconfig.pyright.setup {
            on_attach = on_attach,
        }
    end
}
