require('telescope').setup {
    pickers = {
        buffers = {
            -- starting in normal mode
            initial_mode = 'normal'
        }
    }
}

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- горячие клавиши
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>fgc', '<cmd>lua require"telescope.builtin".live_grep{search_dirs={"%:p"}}<CR>', opts)
map('n', '<leader>fgs', '<cmd>Telescope grep_string<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
map('n', '<leader>fjl', '<cmd>Telescope jumplist<CR>', opts)
map('n', '<leader>fm', '<cmd>Telescope marks<CR>', opts)
map('n', '<leader>fgb', '<cmd>Telescope git_branches<CR>', opts)
map('n', '<leader>gst', '<cmd>Telescope git_status<CR>', opts)
