local set = vim.api.nvim_set_hl

-- Bas
set(0, "Normal",       { fg = "#d0d0d0", bg = "NONE" })
set(0, "NormalNC",     { fg = "#c0c0c0" })

-- Kommentarer
set(0, "Comment",      { fg = "#7f9f9f", italic = true })

-- Typer / statements (mindre cyan-chock)
set(0, "Type",         { fg = "#8fbfdc" })
set(0, "Statement",   { fg = "#8fbfdc" })
set(0, "Identifier",  { fg = "#9bbbdc" })

-- Konstanter (mjukare lila)
set(0, "Constant",    { fg = "#b39ddb" })
set(0, "Number",      { fg = "#b39ddb" })

-- Preprocessor
set(0, "PreProc",     { fg = "#8fbfbf" })

-- UI
set(0, "LineNr",       { fg = "#707070" })
set(0, "CursorLineNr", { fg = "#b0b0b0", bold = true })
set(0, "CursorLine",   { bg = "#1f1f1f" })
set(0, "Visual",       { bg = "#303030" })
