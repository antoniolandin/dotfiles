local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- we need to set the leader key or lazy.nvim won't work ---
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Load plugins ---
require("lazy").setup("plugins")
