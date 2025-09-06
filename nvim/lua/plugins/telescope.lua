return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        'nvim-lua/plenary.nvim',
    },
    cmd = "Telescope",
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    },
    config = function(_, opts)
        local telescope = require('telescope')
        telescope.setup(opts)
        telescope.load_extension('fzf')
    end,

}
