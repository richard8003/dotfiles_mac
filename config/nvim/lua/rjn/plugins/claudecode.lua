return {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = function()
        require('claudecode').setup()
        -- Mappings for Claude Code
        vim.api.nvim_set_keymap("n", "<leader>ac", ":ClaudeCode<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "<leader>af", ":ClaudeCodeFocus<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "<leader>ar", ":ClaudeCode --resume<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "<leader>ab", ":ClaudeCodeAdd %<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("v", "<leader>as", ":ClaudeCodeSend<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "<leader>aa", ":ClaudeCodeDiffAccept<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "<leader>ad", ":ClaudeCodeDiffDeny<cr>", { noremap = true, silent = false })
    end
}
