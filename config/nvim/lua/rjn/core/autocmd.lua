-- vim.api.nvim_create_augroup('AutoFormatting', {})
-- vim.api.nvim_create_autocmd('BufWritePre', {
--     pattern = { '*.lua' },
--     -- pattern = { '*.lua', '*.c' },
--     group = 'AutoFormatting',
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.lua",
	callback = function()
		vim.cmd("silent! !stylua %")
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.html" },
	callback = function(ev)
		-- Skelleton snippet
		vim.keymap.set("n", "<leader>kk", ":-1read $HOME/.config/nvim/.snippets/skeleton.html<CR>3l", { silent = true, buffer = ev.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.c" },
	callback = function(ev)
		-- Skelleton snippet
		vim.keymap.set("n", "<leader>sk", ":-1read $HOME/.config/nvim/.snippets/skeleton.c<CR>3l", { silent = true, buffer = ev.buf })
		-- Run current file
		vim.keymap.set("n", "ru", ":!gcc -o %:r.out % && ./%:r.out<CR>", { buffer = ev.buf })
	end,
})

-- Golang mappings
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.go" },
	callback = function(ev)
		vim.keymap.set("i", "lll", "fmt.Println()<Esc>i", { buffer = ev.buf })
		vim.keymap.set("i", "fff", "fmt.Printf()<Esc>i", { buffer = ev.buf })
		vim.keymap.set("i", "pf", "fmt.Printf()<Esc>i", { buffer = ev.buf })
		vim.keymap.set("i", "::", ":= ", { buffer = ev.buf })
		vim.keymap.set("n", "<leader>ll", ":-1read $HOME/.config/nvim/.snippets/skeleton.go<CR>3l", { silent = true, buffer = ev.buf })
		-- vim.keymap.set("n", "ru", ":!go run %<CR>")
		-- vim.keymap.set("n", "ru", ":w<CR>:!go run all<CR>") --Run Go file from nvim
		vim.keymap.set("n", "ru", ":w<CR>:!go run %<CR>", { buffer = ev.buf }) --Run Go file from nvim
	end,
})
-- Javascript mappings
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.js", "*.ts", "*.vue" },
	callback = function(ev)
		vim.keymap.set("i", "clg", "console.log()<ESC>i", { buffer = ev.buf })
		vim.keymap.set("i", ">>", "=> {}<ESC>i<CR><ESC>O", { noremap = false, silent = false, buffer = ev.buf })
		vim.keymap.set("i", "444", "() => {}<ESC>i<CR><ESC>O", { noremap = false, silent = false, buffer = ev.buf })
		vim.keymap.set("n", "ru", ":!node %<CR>", { buffer = ev.buf })
	end,
})
