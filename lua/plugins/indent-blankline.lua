return {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        show_trailing_blankline_indent = false
    },
    config = function()
        require('ibl').setup {
            indent = {
                char = '┊'
            }
        }
    end
}
