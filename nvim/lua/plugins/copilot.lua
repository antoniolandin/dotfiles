return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        filetypes = {
            markdown = true,
            text = false,
            yaml = true,
        },
        suggestion = {
            enable = false,
            keymap = {
                accept = "<S-Tab>",
                --       accept_word = false,
                --       accept_line = false,
                next = "<C-Tab>",
                --       dismiss = "<M-C-Tab>",
            }
        }
    },
}
