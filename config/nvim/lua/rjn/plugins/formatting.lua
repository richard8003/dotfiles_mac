return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({

            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                -- markdown = { "prettier" },
                vue = { "prettier" },
                cypress = { "prettier" },
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
            },
            -- format_on_save = {
            -- lsp_fallback = true,
            -- async = false,
            -- timeout_ms = 500
            -- }
        })
        vim.keymap.set({ "n", "v" }, "fo", function() -- fo is the keymap to press to trigger formatting
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500
            })
        end, { desc = "Format file or range (in visual mode)" })
    end
}
