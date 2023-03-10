vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
    params.context = { only = {'source.organizeImports'} }
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end,
})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.formatting_sync(nil, 3000)
  end
})

local Mkdir = vim.api.nvim_create_augroup("Mkdir", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  command = 'call mkdir(expand("<afile>:p:h"), "p")',
  group = Mkdir,
})

local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup('TrimWhiteSpaceGrp', {})
vim.api.nvim_create_autocmd('BufWritePre', {
	group = TrimWhiteSpaceGrp,
  pattern = '*',
  command = '%s/\\s\\+$//e',
})

local YankHighlightGrp = vim.api.nvim_create_augroup('YankHighlightGrp', {})
vim.api.nvim_create_autocmd('TextYankPost', {
	group = YankHighlightGrp,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 700, })
  end,
})
