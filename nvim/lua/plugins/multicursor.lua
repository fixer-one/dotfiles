return {
    'jake-stewart/multicursor.nvim',
    keys = { '<C-n>' },
    branch = '1.0',
    config = function()
        require('configs.multicursor')
    end,
}
