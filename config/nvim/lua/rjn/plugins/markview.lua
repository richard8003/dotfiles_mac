return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
        -- You will not need this if you installed the
        -- parsers manually
        -- Or if the parsers are in your $RUNTIMEPATH
        "nvim-treesitter/nvim-treesitter",

        "nvim-tree/nvim-web-devicons",
    },

    opts = {
        modes = { "n", "i", "no", "c" },
        hybrid_modes = { "i" },

        -- This is nice to have
        callbacks = {
            on_enable = function(_, win)
                vim.wo[win].conceallevel = 2
                vim.wo[win].concealcursor = "nc"
            end,
        },
    },

    vim.keymap.set("n", "mv", ":Markview toggle<CR>"),
    vim.keymap.set("n", "mt", ":Markview splitToggle<CR>"),
}
-- return {
-- "OXY2DEV/markview.nvim",
-- lazy = false, -- Recommended
-- dependencies = {
-- -- You will not need this if you installed the
-- -- parsers manually
-- -- Or if the parsers are in your $RUNTIMEPATH
-- "nvim-treesitter/nvim-treesitter",
-- "nvim-tree/nvim-web-devicons",
-- },
-- config = function()
-- opts = {
-- modes = { "n", "i", "no", "c" },
-- hybrid_modes = { "i" },
--
-- -- This is nice to have
-- callbacks = {
-- on_enable = function(_, win)
-- vim.wo[win].conceallevel = 2
-- vim.wo[win].concealcursor = "nc"
-- end,
-- },
-- vim.keymap.set("n", "mv", ":Markview toggle<CR>"),
-- vim.keymap.set("n", "mt", ":Markview splitToggle<CR>"),
-- -- code_blocks = {
-- -- enable = true,
-- --
-- -- --- Icon provider for the block icons & signs.
-- -- ---
-- -- --- Possible values are,
-- -- ---   • "devicons", Uses `nvim-web-devicons`.
-- -- ---   • "mini", Uses `mini.icons`.
-- -- ---   • "internal", Uses the internal icon provider.
-- -- ---   • "", Disables icons
-- -- ---
-- -- ---@type "devicons" | "mini" | "internal" | ""
-- -- icons = "internal",
-- --
-- -- --- Render style for the code block.
-- -- ---
-- -- --- Possible values are,
-- -- ---   • "simple", Simple line highlighting.
-- -- ---   • "minimal", Box surrounding the code block.
-- -- ---   • "language", Signs, icons & much more.
-- -- ---
-- -- ---@type "simple" | "minimal" | "language"
-- -- -- style = "language",
-- -- style = "simple",
-- --
-- -- --- Primary highlight group.
-- -- --- Used by other options that end with "_hl" when
-- -- --- their values are nil.
-- -- ---@type string
-- -- hl = "MarkviewCode",
-- --
-- -- --- Highlight group for the info string
-- -- ---@type string
-- -- info_hl = "MarkviewCodeInfo",
-- --
-- -- --- Minimum width of a code block.
-- -- ---@type integer
-- -- min_width = 40,
-- --
-- -- --- Left & right padding amount
-- -- ---@type integer
-- -- pad_amount = 3,
-- --
-- -- --- Character to use as whitespace
-- -- ---@type string?
-- -- pad_char = " ",
-- --
-- -- --- Table containing various code block language names
-- -- --- and the text to show.
-- -- --- e.g. { cpp = "C++" }
-- -- ---@type { [string]: string }
-- -- language_names = nil,
-- --
-- -- --- Direction of the language preview
-- -- ---@type "left" | "right"
-- -- language_direction = "right",
-- --
-- -- --- Enables signs
-- -- ---@type boolean
-- -- sign = true,
-- --
-- -- --- Highlight group for the sign
-- -- ---@type string?
-- -- sign_hl = nil,
-- -- },
-- }
-- end,
-- }
