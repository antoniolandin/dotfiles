vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- Move selected line / block of text in visual mode ---
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- Keep cursor centered ---
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- Replace word under cursor ---
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--- Obsidian ---
vim.keymap.set("n", "<leader>os", vim.cmd.ObsidianSearch)
vim.keymap.set("n", "<leader>oq", vim.cmd.ObsidianQuickSwitch)
vim.keymap.set("n", "<leader>op", vim.cmd.ObsidianPasteImg)
vim.keymap.set("n", "<leader>oo", vim.cmd.ObsidianOpen)
vim.keymap.set("n", "<leader>on", [[:ObsidianNew<CR>]])

--- Unbind arrow keys ---
for _, mode in pairs({ 'n', 'i', 'v', 'x' }) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
        vim.keymap.set(mode, key, '<nop>')
    end
end

