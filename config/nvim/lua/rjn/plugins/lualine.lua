return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")     -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "none" },         -- can use "none" or "bold"
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "none" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "none" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "none" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }


    lualine.setup {
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
        -- theme = my_lualine_theme
        -- theme = 'horizon'
        -- theme = 'auto'
        -- theme = '16color'
        -- theme = 'ayu_dark'
        -- theme = 'ayu_light'
        -- theme = 'ayu_mirage'
        -- theme = 'ayu'
        -- theme = 'base16'
        -- theme = 'codedark'
        -- theme = 'dracula'
        -- theme = 'everforest'
        -- theme = 'gruvbox_dark'
        -- theme = 'gruvbox_light'
        -- theme = 'gruvbox'
        -- theme = 'gruvbox-material'
        -- theme = 'horizon'
        -- theme = 'iceberg_dark'
        -- theme = 'iceberg_light'
        -- theme = 'iceberg'
        -- theme = 'jellybeans'
        -- theme = 'material'
        -- theme = 'modus-vivendi'
        -- theme = 'molokai'
        -- theme = 'moonfly'
        -- theme = 'nightfly'
        theme = 'nord'
        -- theme = 'OceanicNext'
        -- theme = 'onedark'
        -- theme = 'onelight'
        -- theme = 'palenight'
        -- theme = 'papercolor_dark'
        -- theme = 'papercolor_light'
        -- theme = 'PaperColor'
        -- theme = 'powerline'
        -- theme = 'powerline_dark'
        -- theme = 'pywal'
        -- theme = 'seoul256'
        -- theme = 'solarized_dark'
        -- theme = 'solarized_light'
        -- theme = 'Tomorrow'
        -- theme = 'wombat'
      },
      sections = {
        lualine_x = {
          {
            -- require("noice").api.statusline.mode.get,
            -- cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            -- require("noice").api.status.command.get,
            -- cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_a = {
          {
            'buffers',
          }
        }
      }
    }
  end,
}
