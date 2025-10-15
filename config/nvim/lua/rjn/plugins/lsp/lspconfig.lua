return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Always show signcolumn
        vim.opt.signcolumn = "yes"

        -- Diagnostics config
        vim.diagnostic.config({
            virtual_text = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "",
                },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        -- Show diagnostics popup on CursorHold
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
            end,
        })

        -- Toggle inlay hints
        vim.keymap.set("n", "<leader>ht", function()
            local buf = 0
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
        end, { desc = "Toggle inlay hints" })

        -- Common keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                opts.desc = "Go to definition"
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                opts.desc = "Code actions"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        })

        ----------------------------------------------------------------
        -- Helper: Start server on specific filetypes
        ----------------------------------------------------------------
        local function start_on_filetypes(patterns, cfg)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = patterns,
                callback = function(ev)
                    vim.lsp.start(vim.tbl_deep_extend("force", {}, cfg), { bufnr = ev.buf })
                end,
            })
        end

        ----------------------------------------------------------------
        -- Language servers
        ----------------------------------------------------------------

        -- Lua
        start_on_filetypes({ "lua" }, {
            name = "lua_ls",
            cmd = { "lua-language-server" },
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        })

        -- TypeScript / JavaScript
        start_on_filetypes(
            { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "less", "sass", "scss", "pug" },
            {
                name = "ts_ls",
                cmd = { "typescript-language-server", "--stdio" },
                root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
                capabilities = capabilities,
            }
        )

        -- Go
        start_on_filetypes({ "go" }, {
            name = "gopls",
            cmd = { "gopls" },
            capabilities = capabilities,
        })

        -- C/C++
        start_on_filetypes({ "c", "cpp" }, {
            name = "clangd",
            cmd = { "clangd" },
            capabilities = capabilities,
        })

        -- Vue (Volar)
        start_on_filetypes({ "vue" }, {
            name = "volar",
            cmd = { "vue-language-server", "--stdio" },
            init_options = {
                typescript = {
                    tsdk = vim.fn.expand(
                        "~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib"
                    ),
                },
            },
            capabilities = capabilities,
        })

        -- ESLint
        start_on_filetypes({ "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }, {
            name = "eslint",
            cmd = { "vscode-eslint-language-server", "--stdio" },
            capabilities = capabilities,
        })

        -- Emmet
        start_on_filetypes(
            {
                "vue",
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "pug",
                "typescriptreact",
            },
            {
                name = "emmet_language_server",
                cmd = { "emmet-language-server", "--stdio" },
                capabilities = capabilities,
            }
        )
    end,
}
