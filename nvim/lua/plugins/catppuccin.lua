return {
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
        vim.cmd.colorscheme 'catppuccin-mocha'
        vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
        require('catppuccin').setup {
            transparent_background = true,
            term_colors = true,
            integrations = {
                diffview = true,
                noice = true,
                neotree = true,
                which_key = true,
                treesitter = true,
                notify = true,
                gitsigns = true,
                flash = true,
                blink_cmp = true,
                mason = true,
                snacks = true,
            },
            highlight_overrides = {
                mocha = function(mocha)
                    return {
                        CursorLineNr = { fg = mocha.yellow },
                        FlashMatch = { bg = mocha.red, fg = mocha.base },
                        FlashLabel = { bg = mocha.teal, fg = mocha.base },
                        NormalFloat = { bg = mocha.base },
                        FloatBorder = { bg = mocha.base },
                        FloatTitle = { bg = mocha.base },
                    }
                end,
            },
        }
    end,
}
