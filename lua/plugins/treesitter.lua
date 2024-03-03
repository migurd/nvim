return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "tree-sitter/tree-sitter-embedded-template",
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",

    config = function()
        require "angelq.treesitter"
    end
}
