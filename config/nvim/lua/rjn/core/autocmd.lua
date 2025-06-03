vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.lua' },
    -- pattern = { '*.lua', '*.c' },
    group = 'AutoFormatting',
    callback = function()
        vim.lsp.buf.format()
    end,
})


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.html" },
    callback = function()
        -- Skelleton snippet
        vim.keymap.set("n", "<leader>kk", ":-1read $HOME/.config/nvim/.snippets/skeleton.html<CR>3l", { silent = true })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c" },
    callback = function()
        -- Skelleton snippet
        vim.keymap.set("n", "<leader>sk", ":-1read $HOME/.config/nvim/.snippets/skelleton.c<CR>3l", { silent = true })
        -- Run current file
        vim.keymap.set("n", "ru", ":!gcc -o %:r.out % && ./%:r.out<CR>")
    end,
})

-- Golang mappings
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.go" },
    callback = function()
        vim.keymap.set("i", "lll", "fmt.Println()<Esc>i")
        vim.keymap.set("i", "fff", "fmt.Printf()<Esc>i")
        vim.keymap.set("i", "pf", "fmt.Printf()<Esc>i")
        vim.keymap.set("i", "::", ":= ")
        -- vim.keymap.set("n", "ru", ":!go run %<CR>")
        -- vim.keymap.set("n", "ru", ":w<CR>:!go run all<CR>") --Run Go file from nvim
        vim.keymap.set("n", "ru", ":w<CR>:!go run %<CR>") --Run Go file from nvim
    end,
})
-- Javascript mappings
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.js", "*.ts", "*.vue" },
    callback = function()
        vim.keymap.set("i", "clg", "console.log()<ESC>i")
        vim.keymap.set("i", ">>", "=> {}<ESC>i<CR><ESC>O", { noremap = false, silent = false })
        vim.keymap.set("i", "444", "() => {}<ESC>i<CR><ESC>O", { noremap = false, silent = false })
        vim.keymap.set("n", "ru", ":!node %<CR>")
    end,
})
