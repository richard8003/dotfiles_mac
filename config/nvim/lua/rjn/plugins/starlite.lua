return {
    'ironhouzi/starlite-nvim', -- Word highlighting
    config = function()
        -- Mappings for Starlite-nvim
        vim.api.nvim_set_keymap("n", "*", ":lua require'starlite'.star()<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "g*", ":lua require'starlite'.g_star()<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "#", ":lua require'starlite'.hash()<cr>", { noremap = true, silent = false })
        vim.api.nvim_set_keymap("n", "g#", ":lua require'starlite'.g_hash()<cr>", { noremap = true, silent = false })
    end
}
