local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local proxy = "https://gh-proxy.com/"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = proxy .. 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ { import = 'plugins' } }, { 
    ui = { icons = {}, border = 'rounded' },
    git = {
        url_format = proxy .. "https://github.com/%s.git",
    }
})
