return {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.comment").setup({
            options = {
                -- Function to compute custom 'commentstring' (optional)
                custom_commentstring = nil,
                -- Whether to ignore blank lines when commenting
                ignore_blank_line = false,
                -- Whether to recognize as comment only lines without indent
                start_of_line = false,
                -- Whether to force single space inner padding for comment parts
                pad_comment_parts = true,
            },

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                -- comment = "<leader>l",

                -- Toggle comment on current line
                comment_line = "<leader>l",

                -- Toggle comment on visual selection
                comment_visual = "<leader>l",

                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                -- Works also in Visual mode if mapping differs from `comment_visual`
                textobject = "<leader>l",
            },

            -- Hook functions to be executed at certain stage of commenting
            hooks = {
                -- Before successful commenting. Does nothing by default.
                pre = function() end,
                -- After successful commenting. Does nothing by default.
                post = function() end,
            },
        })

        require("mini.pick").setup({
            -- Delays (in ms; should be at least 1)
            delay = {
                -- Delay between forcing asynchronous behavior
                async = 10,

                -- Delay between computation start and visual feedback about it
                busy = 50,
            },

            -- Keys for performing actions. See `:h MiniPick-actions`.
            mappings = {
                caret_left = "<Left>",
                caret_right = "<Right>",

                choose = "<CR>",
                choose_in_split = "<C-s>",
                choose_in_tabpage = "<C-t>",
                choose_in_vsplit = "<C-v>",
                choose_marked = "<M-CR>",

                delete_char = "<BS>",
                delete_char_right = "<Del>",
                delete_left = "<C-u>",
                delete_word = "<C-w>",

                mark = "<C-x>",
                mark_all = "<C-a>",

                move_down = "<C-n>",
                move_start = "<C-g>",
                move_up = "<C-p>",

                paste = "<C-r>",

                refine = "<C-Space>",
                refine_marked = "<M-Space>",

                scroll_down = "<C-f>",
                scroll_left = "<C-h>",
                scroll_right = "<C-l>",
                scroll_up = "<C-b>",

                stop = "<Esc>",

                toggle_info = "<S-Tab>",
                toggle_preview = "<Tab>",
            },

            -- General options
            options = {
                -- Whether to show content from bottom to top
                content_from_bottom = false,

                -- Whether to cache matches (more speed and memory on repeated prompts)
                use_cache = false,
            },

            -- Source definition. See `:h MiniPick-source`.
            source = {
                items = nil,
                name = nil,
                cwd = nil,

                match = nil,
                show = nil,
                preview = nil,

                choose = nil,
                choose_marked = nil,
            },

            -- Window related options
            window = {
                -- Float window config (table or callable returning it)
                config = nil,

                -- String to use as cursor in prompt
                prompt_cursor = "▏",

                -- String to use as prefix in prompt
                prompt_prefix = "> ",
            },
        })
        vim.keymap.set("n", "<leader>ff", ":Pick files tool='git'<CR>", { silent = true })
        vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { silent = true })
        vim.keymap.set("n", "<leader>g", ":Pick grep<CR>", {})
        vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>", {})
        vim.keymap.set("n", "<leader>r", ":Pick oldfiles<CR>", {})
        vim.keymap.set("n", "<leader>h", ":Pack help<CR>", {})
    end,
}
