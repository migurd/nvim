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
            }
        })

        require('mason-lspconfig').setup_handlers({
            function(server)
                lspconfig[server].setup({})
            end,
        })
    end
}
