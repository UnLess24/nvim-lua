local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- горячие клавиши
map('n', '<leader>duw', '<cmd>lua require("dapui").toggle()<CR>', opts)
map('n', '<leader>duf', '<cmd>lua require("dapui").float_element()<CR>', opts)
map('n', '<leader>due', '<cmd>lua require("dapui").eval()<CR>', opts)
