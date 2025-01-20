local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- Setting the leader key before Lazy is required
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup(
    { { import = "rjn.plugins" }, { import = "rjn.plugins.lsp" }, { import = "rjn.plugins.colorschemes" } }, {
        -- install = {
        -- colorscheme = { "tokyonight" }
        -- },
        checker = {
            enabled = true,
            notify = false
        },
        change_detection = {
            notify = false
        },
        ui = {
            -- a number <1 is a percentage., >1 is a fixed size
            size = { width = 0.8, height = 0.8 },
            wrap = true, -- wrap the lines in the ui
            -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
            border = "rounded",
            -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
            backdrop = 60,
            title = nil, ---@type string only works when border is not "none"
            title_pos = "center", ---@type "center" | "left" | "right"
            -- Show pills on top of the Lazy window
            pills = true, ---@type boolean
            icons = {
                cmd = " ",
                config = "",
                event = " ",
                ft = " ",
                init = " ",
                import = " ",
                keys = " ",
                lazy = "󰒲 ",
                loaded = "●",
                not_loaded = "○",
                plugin = " ",
                runtime = " ",
                require = "󰢱 ",
                source = " ",
                start = " ",
                task = "✔ ",
                list = {
                    "●",
                    "➜",
                    "★",
                    "‒",
                },
            },
        },
    })
