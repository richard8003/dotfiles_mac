return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",

    version = "*",

    opts = {
        keymap = {
            preset = "default",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "select_and_accept", "fallback" },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "Nerd Font Mono",

        },
    },
}
