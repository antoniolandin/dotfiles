return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
            filetypes = {
                markdown = true,
            },
            suggestion = {
                enable = true,
                auto_trigger = true,
                keymap = {
                      accept = "<S-Tab>",
                      accept_word = false,
                      accept_line = false,
                      next = "<C-Tab>",
                      dismiss = "<M-C-Tab>",
                }
            }
        })
  end,
}
