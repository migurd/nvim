vim.o.number = true
vim.g.mapleader = " "
vim.o.relativenumber = true
vim.o.cursorline = true
-- vim.o.colorscheme = "tokyonight-night"

-- Set tab width to 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.termguicolors = true

-- backspace
vim.o.backspace = "indent,eol,start"

-- blank spaces in indent lines
vim.opt.list = true
vim.opt.listchars:append({ space = '·' })
