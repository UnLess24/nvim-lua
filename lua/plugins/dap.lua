vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- горячие клавиши
map('n', '<F11>', '<cmd>lua require"dap".continue()<CR>', opts)
map('n', '<F12>', '<cmd>lua require"dap".close()<CR>', opts)
map('n', '<F7>', '<cmd>lua require"dap".step_into()<CR>', opts)
map('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
map('n', '<F9>', '<cmd>lua require"dap".step_out()<CR>', opts)
map('n', '<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n', '<leader>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)

-- Telescope dap extension required
map('n', '<leader>vars', '<cmd>Telescope dap variables<CR>', opts)
map('n', '<leader>bps', '<cmd>Telescope dap list_breakpoints<CR>', opts)

