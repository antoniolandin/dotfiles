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
            auto_trigger = true,
            keymap = {
                accept = "<S-Tab>",
                next = "<C-Tab>",
            }
        }
    },
}
