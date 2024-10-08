
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.opt.updatetime = 50
vim.opt.scrolloff = 8
vim.o.conceallevel = 1

-- set python virtualenv
vim.g.python3_host_prog=vim.fn.expand("~/.local/share/virtualenvs/neovim/bin/python3")

--- set colorscheme ---
vim.cmd('colorscheme flow')



















































