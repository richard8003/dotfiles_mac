return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({
            winopts = {
                preview = {
                    -- layout = "horizontal"
                    layout = "vertical",
                    default = "none"
                    -- default = "bat"
                    -- default = "head"
                    -- default = "builtin"
                },
                -- height = 0.8,
                -- width = 0.8,
                -- row = 0.5,
                -- hls = { normal = "Pmenu" },
            },
            fzf_opts = {
                ["--no-info"] = "",
                ["--info"] = "hidden",
                ["--padding"] = "5%,2%,5%,3%",
                ["--header"] = " ",
                ["--no-scrollbar"] = "",
            },
            files = {
                formatter = "path.filename_first",
                git_icons = false,
                prompt = "files:",
                no_header = true,
                cwd_header = false,
                cwd_prompt = false,
            },
        })
        vim.keymap.set("n", "<leader>ff", ":FzfLua git_files<CR>", { silent = true })
        vim.keymap.set("n", "<leader>f", ":FzfLua files<CR>", { silent = true })
        vim.keymap.set("n", "<leader>g", ":FzfLua grep<CR><CR>", {})
        vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>", {})
        vim.keymap.set("n", "<leader>r", ":FzfLua oldfiles<CR>", {})
        vim.keymap.set("n", "<leader>h", ":FzfLua helptags<CR>", {})
    end,
}
