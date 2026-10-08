-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them.
-- `vim.fs.dir()` iteration order is unspecified and must not be relied upon.
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

local function gh(repo) return 'https://github.com/' .. repo end

-- ============================================================
-- Custom Plugins (vim.pack)
-- ============================================================

-- Seamless navigation between tmux panes and vim splits
vim.pack.add { gh 'christoomey/vim-tmux-navigator' }

-- Asynchronous build and test dispatcher
vim.pack.add { gh 'tpope/vim-dispatch' }

-- Markdown rendering in Neovim buffers
-- Note: nvim-treesitter and mini.nvim are already installed in kickstart's init.lua
vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {}
