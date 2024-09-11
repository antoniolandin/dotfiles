return {
    'jbyuki/nabla.nvim',
    config = function()
        vim.api.nvim_set_keymap('n', '<leader>p', ':lua require"nabla".toggle_virt()<CR>', { noremap = true, silent = true })
    end,
}
