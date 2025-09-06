local palette = require('catppuccin.palettes').get_palette 'mocha'

local M = {}


M.FileIcon = {
    condition = function(self)
        return vim.fn.fnamemodify(self.filename, ':.') ~= ''
    end,
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ':e')
        local icon, hl, _ = MiniIcons.get('file', 'file.' .. extension)
        local bt = vim.api.nvim_get_option_value('buftype', { buf = self.bufnr }) or nil
        if bt and bt == 'terminal' then
            icon = ''
        end
        self.icon = icon
        self.icon_color = string.format('#%06x', vim.api.nvim_get_hl(0, { name = hl })['fg'])
    end,
    provider = function(self)
        return self.icon and (self.icon .. ' ')
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end,
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
M.FileName = {
    init = function(self)
        self.is_modified = vim.api.nvim_get_option_value('modified', { buf = self.bufnr })
    end,
    provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t')
        return ' ' .. filename .. ' '
    end,
    hl = function(self)
        return {
            fg = self.is_modified and palette.yellow or palette.text,
        }
    end,
}


M.FileFlags = {
    {
        condition = function(self)
            local ignored_filetypes = {
                'dap-repl',
            }
            local result = vim.fn.fnamemodify(self.filename, ':.') ~= '' and
                vim.api.nvim_get_option_value('modified', { buf = self.bufnr })
            local ft = vim.api.nvim_get_option_value('buftype', { buf = self.bufnr })
            if vim.tbl_contains(ignored_filetypes, ft) then
                result = false
            end
            return result
        end,
        provider = ' ',
        hl = function(self)
            return { fg = palette.text, bold = self.is_active }
        end,
    },

    {
        condition = function(self)
            return not vim.api.nvim_get_option_value('modifiable', { buf = self.bufnr }) or
                vim.api.nvim_get_option_value('readonly', { buf = self.bufnr })
        end,
        provider = function(self)
            if vim.api.nvim_get_option_value('buftype', { buf = self.bufnr }) == 'terminal' then
                return ''
            else
                return ' '
            end
        end,
        hl = { fg = palette.text },
    },
}

M.FileNameBlock = {
    init = function(self)
        local bufnr = self.bufnr and self.bufnr or 0
        self.filename = vim.api.nvim_buf_get_name(bufnr)
    end,
    hl = { fg = palette.text },
    M.FileIcon,
    M.FileName,
    M.FileFlags,
}
M.TablineFileNameBlock = vim.tbl_extend('force', M.FileNameBlock, {
    on_click = {
        callback = function(_, minwid, _, button)
            if button == 'm' then -- close on mouse middle click
                vim.schedule(function()
                    vim.api.nvim_buf_delete(minwid, { force = false })
                end)
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = 'heirline_tabline_buffer_callback',
    },
})
return M
