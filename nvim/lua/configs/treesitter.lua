for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    config.install_info.url = config.install_info.url:gsub("https://github.com/",
        "https://gh-proxy.com/https://github.com/")
end

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
    ensure_installed = { "bash", "zig", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "regex" },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = { enable = true },
}
