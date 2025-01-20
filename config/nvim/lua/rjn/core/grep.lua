vim.opt.grepprg = "grep -HRIn $* ."

vim.keymap.set("n", "<leader>g", ":copen | :silent :grep ")
