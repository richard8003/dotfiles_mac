-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.opt.timeoutlen = 200
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_perl_provider = 0

-- netrw settigs
-- vim.cmd("let g:netrw_liststyle = 3") -- tree view
vim.cmd("let g:netrw_banner = 0")                                   -- hide the banner
vim.cmd("let g:netrw_altv = 1")                                     -- open splits to the right
vim.cmd("let g:netrw_browse_split = 0")                             -- open splits to the right
vim.cmd("let g:netrw_winsize= 20")                                  -- open splits to the right
vim.cmd("let g:netrw_list_hide = netrw_gitignore#Hide()")
vim.cmd("let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'") -- make line numbers visible at the start ov nvim (to be able to see them in netrw).

vim.opt.path:append("**")

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true         -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- this is used to center the current line vertically
vim.opt.scrolloff = 8

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- appearance
vim.opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift
vim.cmd([[ set t_Co=256 ]])

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
vim.opt.splitright = true     -- split vertical window to the right
vim.opt.splitbelow = true     -- split horizontal window to the bottom

vim.opt.iskeyword:append("-") -- consider string-string as whole word

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- mixed
vim.opt.hlsearch = false  --Set highlight on search
vim.opt.undofile = true   --Save undo history
vim.opt.ignorecase = true --Case insensitive searching unless /C or capital in search
vim.opt.smartcase = true  -- Smart case
vim.opt.updatetime = 50   --Decrease update time
vim.opt.timeoutlen = 200
vim.opt.ttimeoutlen = 10
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = true
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- thir is to make vim 'remember' folds
vim.cmd([[augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END]])

-- This makes comments NOT continue when moving to the next li
vim.cmd([[ autocmd FileType * set formatoptions-=cro") ]])

-- Syntax highlighting for JSON
vim.cmd([[
    au! BufRead,BufNewFile *.json set filetype=json
    augroup json_autocmd
      autocmd!
      autocmd FileType json set autoindent
      autocmd FileType json set formatoptions=tcq2l
      autocmd FileType json set textwidth=78 shiftwidth=2
      autocmd FileType json set softtabstop=2 tabstop=8
      autocmd FileType json set expandtab
      autocmd FileType json set foldmethod=syntax
    augroup END
]])

vim.cmd([[
    autocmd Filetype cpp setlocal ts=2 sw=2 expandtab
]])

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

vim.cmd([[set mouse=]])

-- vim.opt.conceallevel = 1

-- this makes it so that no ~sign is shown on empty lines in the buffer
vim.wo.fillchars = "eob: "

-- make the background transparent
vim.cmd([[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
]])

vim.cmd([[
autocmd BufWinEnter,WinEnter term://* startinsert
]])
-- START NETRW WHEN VIM STARTS
-- Checks if there is a file open after Vim starts up,
-- and if not, open the current working directory in Netrw.
vim.cmd([[augroup InitNetrw
  autocmd!
  autocmd VimEnter * if expand("%") == "" | edit . | endif
augroup END
    ]])

-- settings for the cursor
-- vim.opt.guicursor = {
-- "n-v-c:block-nCursor/nCursor",
-- "i-ci:block-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
-- "r:hor50-Cursor/lCursor-blinkwait700-blinkon100-blinkoff100",
-- }

-- vim.cmd([[
-- highlight Cursor guifg=white guibg=darkgrey
--
-- highlight iCursor guifg=white guibg=white
--
-- set guicursor=n-v-c:block-Cursor
-- set guicursor+=n-v-c:blinkon0
--
-- set guicursor+=i:block-iCursor
-- set guicursor+=i:blinkon1
-- set guicursor+=i:blinkwait0
-- ]])
