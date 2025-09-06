local header = [[
 ██████╗██╗   ██╗███████╗██████╗ ██╗   ██╗██╗███╗   ███╗
██╔════╝╚██╗ ██╔╝██╔════╝██╔══██╗██║   ██║██║████╗ ████║
██║      ╚████╔╝ █████╗  ██████╔╝██║   ██║██║██╔████╔██║
██║       ╚██╔╝  ██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
╚██████╗   ██║   ███████╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

require('snacks').setup {
    dashboard = {
        preset = {
            header = header,
            keys = {
                { icon = '󰈞 ', key = 'f', desc = 'Find files', action = ':lua Snacks.picker.smart()' },
                { icon = ' ', key = 'o', desc = 'Find history', action = 'lua Snacks.picker.recent()' },
                { icon = ' ', key = 'e', desc = 'New file', action = ':enew' },
                { icon = ' ', key = 'o', desc = 'Recent files', action = ':lua Snacks.picker.recent()' },
                { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
                { icon = '󰔛 ', key = 'P', desc = 'Lazy Profile', action = ':Lazy profile', enabled = package.loaded.lazy ~= nil },
                { icon = ' ', key = 'M', desc = 'Mason', action = ':Mason', enabled = package.loaded.lazy ~= nil },
                { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
            },
        },
        sections = {
            { section = 'header' },
            { section = 'keys',   indent = 1, padding = 1 },
            { section = 'startup' }
        },
    },

    picker = {
        enabled = true,
    },
    indent = {
        enabled = true
    }
}
