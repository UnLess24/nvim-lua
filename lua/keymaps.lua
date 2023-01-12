local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

-- переход в Ex мод
map('n', '<leader>pv', ':Ex<CR>', opts)
map('n', 'Q', '<nop>', opts) -- анбинд Q

-- упрощенная индентация
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- отключение стрелочек (только hjkl)
map('', '<up>', '', opts)
map('', '<down>', '', opts)
map('', '<left>', '', opts)
map('', '<right>', '', opts)

map('n', '<leader>rest', '<Plug>RestNvim', opts)
map('n', '<leader>rests', '<Plug>RestNvimPreview', opts)

-- Set pretty JSON
-- !python -m json.tool

-- copy|past clipboard
map('v', '<leader>y', '"*y', opts)
map('n', '<leader>p', '"*p', opts)
map('n', '<leader>Y', '"*yy', opts)

-- Buffer Line select buffer map
map('n', 'gt', '<cmd>bnext<CR>', opts)
map('n', 'gT', '<cmd>bprevious<CR>', opts)
map('n', '<leader>bd', '<cmd>BufferLinePickClose<CR>', opts)
map('n', '<leader>bs', '<cmd>BufferLinePick<CR>', opts)

