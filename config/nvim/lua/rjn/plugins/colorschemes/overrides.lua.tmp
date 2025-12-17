return {
    -- line numbers
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#7DA3F4", bold = true }), -- green
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#7B7B7B", bold = true }), -- red pastel
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffc4fb" }),
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2A2940" }), -- pick a faint bg
    -- 2A2940
    vim.api.nvim_set_hl(0, "Cursor", { reverse = true, bg = "NONE" }),

    -- highlight Cursor guifg=white guibg=#547998
    vim.cmd([[
    highlight Cursor guifg=white guibg=#636DA6
    highlight iCursor guifg=white guibg=pink
    " highlight iCursor guifg=white guibg=white
    highlight qCursor guifg=white guibg=orange

    set guicursor=n-v-c:block-Cursor
    set guicursor+=v:block-qCursor

    set guicursor+=n:block-Cursor
    set guicursor+=n-v-c:blinkon0

    set guicursor+=i:block-iCursor
    set guicursor+=i:blinkon0
    " set guicursor+=i:blinkwait0

]]),
}
