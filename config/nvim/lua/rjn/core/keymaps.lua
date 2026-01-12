-- switching j and k for colemac navigation
-- vim.keymap.set("n", "j", "k")
-- vim.keymap.set("n", "k", "j")
-- vim.keymap.set("v", "j", "k")
-- vim.keymap.set("v", "k", "j")

-- terminal mode
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("i", "{{", "{}<ESC>i", { noremap = false, silent = false })
vim.keymap.set("i", "}}", "{}<ESC>i<CR><ESC>O", { noremap = false, silent = false })
vim.keymap.set("i", "((", "()<ESC>i", { noremap = false, silent = false })
vim.keymap.set("i", "))", "()<ESC>i<CR><ESC>O", { noremap = false, silent = false })
vim.keymap.set("i", "[[", "[]<ESC>i", { noremap = false, silent = false })
vim.keymap.set("i", "]]", "[]<ESC>i<CR><ESC>O", { noremap = false, silent = false })
vim.keymap.set("i", '""', '""<ESC>i', { noremap = false, silent = false })
vim.keymap.set("i", "''", "''<ESC>i", { noremap = false, silent = false })

-- tabs
vim.keymap.set("n", "tl", ":tabnext<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "th", ":tabprev<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "tc", ":tabclose<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "tn", ":tabnew<CR>", { noremap = false, silent = true })

--Remove the highligten search text
vim.keymap.set("n", "<ESC>", ":noh<CR>", { silent = true })

--Replace
vim.api.nvim_set_keymap("n", "<Leader>r", ":s/", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "<Leader>r", ":s/", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>ra", ":%s/", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "<Leader>ra", ":%s/", { noremap = true, silent = false })

-- vim.keymap.set("n", "go", ":w<CR>:!go run all<CR>") --Run Go file from nvim
-- vim.keymap.set("n", "go", ":w<CR>:!go run %<CR>") --Run Go file from nvim
-- vim.keymap.set("n", "go", ":w<CR>:!go run .<CR>") --Run Go file from nvim

-- run js code in vim
vim.keymap.set("n", "<leader>jj", ":!node %<CR>")
-- vim.keymap.set('n', '<leader>ts', ':!ts-node %<CR>')

-- more adjusthents for colemak-dh
vim.keymap.set("n", "<c-m>", ":wincmd h<CR>")
vim.api.nvim_set_keymap("n", "m", "h", { noremap = true })
vim.api.nvim_set_keymap("v", "m", "h", { noremap = true })

--" Make Y copy from the cursor and not the whole line. Just like D or C
vim.keymap.set("n", "Y", "y$")

-- comments
-- default #
-- vim.keymap.set("n", "<leader>l", ":norm _i#<CR>")
-- vim.keymap.set("n", "<leader>ll", ":norm ^x<CR>")
-- vim.keymap.set("v", "<leader>l", ":norm _i#<CR>")
-- vim.keymap.set("v", "<leader>ll", ":norm ^x<cr>")

-- auto format code
vim.keymap.set("n", "<leader>w", vim.lsp.buf.format)

-- File explorer
vim.keymap.set("n", "<leader>tt", ":vs<CR> || :Ex<CR>")
-- vim.keymap.set("n", "<leader>tt", ":vs<CR> || :Ex<CR>")
vim.keymap.set("n", "<leader>t", ":Ex<CR>")
-- vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- Better tabbing
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Open register list
vim.keymap.set("n", "re", ":reg<CR>", { silent = true })

-- Resize buffer
-- press Alt and the two buttons above ENTER and SPACE
vim.keymap.set("n", "›", ":vertical resize +3<CR>")
vim.keymap.set("n", "‹", ":vertical resize -3<CR>")
vim.keymap.set("n", "π", ":resize +3<CR>")
vim.keymap.set("n", "¸", ":resize -3<C>")

-- Close buffer
vim.keymap.set("n", "X", ":bd<CR>")
-- Quit without saving
vim.keymap.set("n", "QQ", ":q!")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- allows the cursor to stay in the same place while appending the line below
-- vim.keymap.set("n", "J", "mzJ`z")

-- these two keeps the cursor in the middle of the screeen while c-d c-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep the cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever: when you paste you still keep the word that you pasted instead of the word you replaced
-- vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("x", "p", [["_dP]])

-- leader s to replace the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- leader y to yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>d", [["_d]])

-- tab between buffers
vim.keymap.set("n", "<tab>", ":bnext<CR>")
vim.keymap.set("n", "<s-tab>", ":bprev<CR>")

-- GIT
-- local function git_push()
-- 	vim.cmd(":silent !git add")
-- 	vim.cmd(':silent !git commit -m "fooba"')
-- 	vim.cmd(":silent !git push")
-- 	print("Git: pushed current file...")
-- end
local function git_push()
	vim.cmd(":silent !git add .")
	vim.cmd(':silent !git commit -m "fooba"')
	vim.cmd(":silent !git push")
	print("Git: pushed current file...")
end

local function git_push_all()
	-- vim.cmd(":silent !git add")
	-- vim.cmd(':silent !git commit -m "fooba"')
	-- vim.cmd(":silent !git push")
	-- print("Git: pushed all")
	vim.cmd(":!git add")
	vim.cmd(':!git commit -m "fooba"')
	vim.cmd(":!git push")
	-- print("Git: pushed all")
end

vim.keymap.set("n", "<leader>pf", git_push)
vim.keymap.set("n", "<leader>pp", git_push_all)

-- pane navigation
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })

vim.keymap.set("i", "<c-s>", "<esc>bdw", { silent = true })

function ToggleQuickfix()
	-- Kolla om quickfix-fönstret redan är öppet
	local winid = vim.fn.getqflist({ winid = 0 }).winid
	if winid ~= 0 then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end

vim.keymap.set("n", "<leader>qo", ":lua ToggleQuickfix()<CR>", { silent = true })
vim.keymap.set("n", "<leader>n", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", ":cprev<CR>", { silent = true })
