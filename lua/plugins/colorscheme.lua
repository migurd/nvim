return { 
	"catppuccin/nvim",
	name = "catppuccin",
    lazy = false,
	priority = 1000,
    config = function()
        -- Plugin catppuccin
        require("catppuccin").setup({
            transparent_background = true, -- disables setting the background color.
        })
        vim.cmd.colorscheme = "catppuccin"
    end,
}
