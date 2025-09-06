return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre', 'InsertEnter' },
    cmd = { 'ConformInfo', 'FormatEnable', 'FormatDisable' },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            toml = { "taplo" }
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 1000,
            lsp_format = "fallback",
        },
    },
}
