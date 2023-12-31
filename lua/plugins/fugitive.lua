return {
    "tpope/vim-fugitive",
    cmd = {"G", "Git"}, -- Loads once either command is used
    keys = {
        {"<leader>ga", ":Git fetch --all -p<cr>", desc = "Git fetch"},
        {"<leader>gl", ":Git pull<cr>", desc = "Git pull"},
        {"<leader>gp", ":Git push<cr>", desc = "Git push"},
        {"<leader>gs", ":Git status<cr>", desc = "Git status"},
    },
}
