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
        experimental = {
            -- turn the check off entirely:
            check_rtp = false,
            -- or just hide the message:
            -- check_rtp_message = false,
        },

        preview = {
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
    },

    vim.keymap.set("n", "mt", function()
        vim.cmd([[
        Markview splitToggle
        normal <C-c>
        ]])
    end),
    vim.keymap.set("n", "mv", function()
        vim.cmd([[
        Markview toggle
        normal <C-c>
        ]])
    end),
}
