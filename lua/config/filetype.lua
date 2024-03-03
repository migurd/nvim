-- EJS
vim.filetype.add({ extension = { ejs = "ejs" } })

-- Add the autocmd for EJS files
vim.api.nvim_exec([[
  au BufNewFile,BufRead *.ejs set filetype=html
]], false)
