return {
    "williamboman/mason.nvim",
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local lspconfig = require('lspconfig')

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'clangd',
                'pyright',
                'html',
                'cssls',
                'jsonls',
                'quick_lint_js',
                'tsserver',
                'tailwindcss',
                'emmet_language_server',
                'bashls',
                'dart-debug-adapter',
                'arduino_language_server',
                'dockerls',
                'golangci_lint_ls',
                'gopls',
                'kotlin_language_server',
                'jdtls',
                'grammarly',
                'prettier',
                'prettierd',
            }
        })

        require('mason-lspconfig').setup_handlers({
            function(server)
                lspconfig[server].setup({})
            end,
        })
    end
}
