vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg='#993939', bg='#ffffff' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { fg='#61afef', bg='#ffffff' })
vim.api.nvim_set_hl(0, 'DapStopped', { fg='#993939', bg='#ffffff' })
-- vim.api.nvim_set_hl('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#ffffff' }, false)
-- vim.api.nvim_set_hl('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#ffffff' }, false)
-- vim.api.nvim_set_hl('DapStopped', { ctermbg=0, guifg='#98c379', guibg='#ffffff' }, false)

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='', numhl= 'DapStopped' })

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- горячие клавиши
map('n', '<F11>', '<cmd>lua require"dap".continue()<CR>', opts)
map('n', '<F12>', '<cmd>lua require"dap".close()<CR>', opts)
map('n', '<F7>', '<cmd>lua require"dap".step_into()<CR>', opts)
map('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
map('n', '<leader><F8>', '<cmd>lua require"dap".run_to_cursor()<CR>', opts)
map('n', '<F9>', '<cmd>lua require"dap".step_out()<CR>', opts)
map('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n', '<leader>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)

-- Telescope dap extension required
map('n', '<leader>vars', '<cmd>Telescope dap variables<CR>', opts)
map('n', '<leader>bps', '<cmd>Telescope dap list_breakpoints<CR>', opts)

