return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        filetypes = {
            markdown = true,
            text = false
        },
        suggestion = {
            enable = true,
            auto_trigger = true,
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
