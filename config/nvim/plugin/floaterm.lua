vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}
local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer (non-listed, scratch)
    end


    -- local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer (non-listed, scratch)
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",  -- Use "minimal" style to remove UI elements
        border = "rounded", -- Optional: Add a border (e.g., "single", "double", "rounded")
    })

    return { buf = buf, win = win }
end

local toggle_terminal = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
-- vim.keymap.set({ "n" }, "<leader>tt", toggle_terminal)


-- vim.api.nvim_create_user_command("Floaterminal", function()
-- if not vim.api.nvim_win_is_valid(state.floating.win) then
-- state.floating = create_floating_window { buf = state.floating.buf }
-- if vim.bo[state.floating.buf].buftype ~= "terminal" then
-- vim.cmd.term()
-- end
-- else
-- vim.api.nvim_win_hide(state.floating.win)
-- end
-- end, {})