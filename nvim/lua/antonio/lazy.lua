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

--- Load plugins ---
require("lazy").setup("antonio.plugins")

--- LSP ---
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  --- see :help lsp-zero-keybindings
  --- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
      'tsserver',
      'eslint',
      'lua_ls',
      'rust_analyzer',
      'pyright',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})


local lspconfig = require('lspconfig')

--- omitir el error de undefined global vim ---
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
})

--- Autopairs ---
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
npairs.add_rule(
    Rule("$", "$",{"tex", "latex","md", "markdown"})
)

npairs.add_rule(
    Rule("|", "|",{"tex", "latex","md", "markdown"})
)
