return { 
	"cpea2506/one_monokai.nvim",
    lazy = false,
	priority = 1000,
    config = function()
        require("one_monokai").setup({
            transparent = true,
        })
        vim.o.colorscheme = "one_monokai"
    end,
}
