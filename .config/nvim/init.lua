local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

require("plugins")

local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd


-- mouse release = send selection to clipboard
-- nvim_set_keymap() help: see https://github.com/nanotee/nvim-lua-guide
local default_opts = { noremap = true, silent = true }
api.nvim_set_keymap("v", "<LeftRelease>", '"*ygv', default_opts)

opt.termguicolors = true   -- Enable colors in terminal
opt.hlsearch = true        -- Set highlight on search
opt.number = true          -- Make line numbers default
opt.relativenumber = true  -- Make relative number default
opt.mouse = "a"            -- Enable mouse mode
opt.breakindent = true     -- Enable break indent
opt.undofile = true        -- Save undo history
opt.ignorecase = true      -- Case insensitive searching unless /C or capital in search
opt.smartcase = true       -- Smart case
opt.updatetime = 250       -- Decrease update time
opt.signcolumn = "yes"     -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.showmode = false       -- Do not need to show the mode. We use the statusline instead.
opt.showmatch = true       -- highlight matching brackets
opt.joinspaces = false     -- No double spaces with join after a dot
opt.list = true            -- show space and tabs chars
-- opt.listchars = "eol:⏎,tab:▸·,trail:×,nbsp:⎵"  -- make tab, etc visible
opt.spelllang = "en_us"
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

opt.tabstop = 4         -- set tabstop to 4 spaces
opt.softtabstop = 4     -- use 4 spaces for <Tab>
opt.shiftwidth = 4      -- set indentation level to 4 spaces
opt.expandtab = true    -- use spaces instead of tabs

-- prefer `monokai-pro` color scheme


-- monokai config
vim.g.monokaipro_filter = 'spectrum'
vim.g.monokaipro_colors = { hint = "orange", error = "#ff0000" }

cmd [[

colorscheme monokaipro
inoremap <C-BS> <C-w>
cmap w!! w !sudo tee > /dev/null %

]]

-- enable the language server
require'lspconfig'.clangd.setup{}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.tsserver.setup{}
require('evil_lualine')


-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<F8>", ":w<CR>:!~/.script/cpp_runner.sh %<CR>", { silent = true })

-- enable cmp completion plugin
require('cmpconfig')
