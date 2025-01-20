vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.lua' },
    -- pattern = { '*.lua', '*.c' },
    group = 'AutoFormatting',
    callback = function()
        vim.lsp.buf.format()
    end,
})


-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- pattern = { "keymap.c", "combos.c", "definitions.c", "tapdance.c", "macros.c" },
-- callback = function(args)
-- vim.diagnostic.enable(false)
-- end,
-- })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.html" },
    callback = function(args)
        -- Skelleton snippet
        vim.keymap.set("n", "<leader>kk", ":-1read $HOME/.config/nvim/.snippets/skeleton.html<CR>3l", { silent = true })
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c", "*.js", "*.go" },
    callback = function(args)
        -- Skelleton snippet
        vim.keymap.set("n", "<leader>sk", ":-1read $HOME/.config/nvim/.snippets/skelleton.c<CR>3l", { silent = true })
        -- Run current file
        vim.keymap.set("n", "<leader>c", ":!gcc -o %:r.out % && ./%:r.out<CR>")
    end,
})

-- c type comments //
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.c", "*.js", "*.go" },
    callback = function(args)
        vim.keymap.set("n", "<leader>l", ":norm _i// <CR>")
        vim.keymap.set("n", "<leader>ll", ":norm ^xxx <CR>")
        vim.keymap.set("v", "<leader>l", ":norm _i// <CR>")
        vim.keymap.set("v", "<leader>ll", ":norm ^xxx <cr>")
        vim.keymap.set("i", ",,", ";")
        -- vim.keymap.set("n", "<leader>w", ":w<CR> :ClangFormat<CR>")
    end,
})

-- Golang mappings
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.go" },
    callback = function(args)
        vim.keymap.set("i", "lll", "fmt.Println()<Esc>i")
        vim.keymap.set("i", "fff", "fmt.Printf()<Esc>i")
        vim.keymap.set("i", "pf", "fmt.Printf()<Esc>i")
        vim.keymap.set("i", "::", ":= ")
    end,
})
-- Javascript mappings
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.js", "*.ts", "*.vue" },
    callback = function(args)
        vim.keymap.set("i", "clg", "console.log()<ESC>i")
        vim.keymap.set("i", ">>", "=> {}<ESC>i<CR><ESC>O", { noremap = false, silent = false })
        vim.keymap.set("i", "444", "() => {}<ESC>i<CR><ESC>O", { noremap = false, silent = false })
    end,
})
-- lua comments --
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*.lua",
    callback = function(args)
        -- vim.keymap.set("n", "<leader>w", ":w<CR> :Format<CR>")
        vim.keymap.set("n", "<leader>l", ":norm _i-- <CR>")
        vim.keymap.set("n", "<leader>ll", ":norm ^xxx <CR>")
        vim.keymap.set("v", "<leader>l", ":norm _i-- <CR>")
        vim.keymap.set("v", "<leader>ll", ":norm ^xxx <cr>")
    end,
})
