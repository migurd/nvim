return {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    -- or                              , branch = "0.1.x",
    dependencies = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-tree/nvim-web-devicons",
   },
    config = function()
        require "angelq.telescope"
    end,
}
