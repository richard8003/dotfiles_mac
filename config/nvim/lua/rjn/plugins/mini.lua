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

        local pick = require("mini.pick")

        function ClearQuickfix()
            vim.fn.setqflist({}, "r")
            print("Quickfix list cleared")
        end

        function GrepToQuickfix()
            pick.builtin.grep_live({
                action = function(items)
                    if not items or #items == 0 then
                        print("No matches found")
                        return
                    end

                    local qf_list = {}
                    for _, item in ipairs(items) do
                        table.insert(qf_list, {
                            filename = item.path,
                            lnum = item.lnum,
                            col = item.col,
                            text = item.text,
                        })
                    end

                    vim.fn.setqflist(qf_list)
                    print("Added " .. #qf_list .. " items to quickfix list")
                    vim.cmd("copen") -- Open the quickfix list
                end,
            })
        end

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

                delete_char = "<BS>",
                delete_char_right = "<Del>",
                delete_left = "<C-u>",
                delete_word = "<C-w>",

                move_down = "<C-n>",
                move_start = "<C-g>",
                move_up = "<C-p>",

                paste = "<C-r>",

                mark = "<C-x>",          -- Mark single item
                mark_all = "<C-a>",      -- Mark all items
                choose_marked = "<C-y>", -- Choose all marked items (instead of <M-CR

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
                -- prompt_cursor = "▏",
                prompt_caret = "▏",

                -- String to use as prefix in prompt
                prompt_prefix = "> ",
            },
        })
        -- this is needed for extra pickers like 'old files'
        require("mini.extra").setup()

        -- mini.statusline
        require("mini.statusline").setup({
            -- You can override sections if you like
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git = MiniStatusline.section_git({ trunc_width = 75 })
                    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local filename = MiniStatusline.section_filename({ trunc_width = 140, path = 1 }) -- 1 = relative path
                    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location = MiniStatusline.section_location({ trunc_width = 75 })

                    return MiniStatusline.combine_groups({
                        -- LEFT
                        { hl = mode_hl,                 strings = { mode } },
                        { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },

                        -- CENTER (filename)
                        "%=",
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                        "%=",

                        -- RIGHT
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl,                  strings = { location } },
                    })
                end,
            },

            set_vim_settings = true,                  -- sets laststatus=2 and showmode=false
            use_icons = vim.g.have_nerd_font == true, -- optional: enable devicons if you have nerd font
        })

        vim.keymap.set("n", "<leader>ff", ":Pick files tool='git'<CR>", { silent = true })
        vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { silent = true })
        vim.keymap.set("n", "<leader>g", ":Pick grep<CR>", {})
        vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>", {})
        vim.keymap.set("n", "<leader>r", ":Pick oldfiles<CR>", {})
        vim.keymap.set("n", "<leader>h", ":Pack help<CR>", {})
    end,
    vim.keymap.set("n", "<leader>lg", ":lua GrepToQuickfix()<CR>", { silent = true }),
    vim.keymap.set("n", "<leader>qq", ":lua ClearQuickfix()<CR>", { silent = true }),
}
