local map = vim.keymap.set
local opts = { noremap=true, silent=true }

-- удалить ошибки диагностики в левом столбце (SignColumn)
vim.diagnostic.config({signs=true})

local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  cmp_tabnine = '[TN]',
  path = '[Path]',
}

cmp.setup({
  completion = {
    autocomplete = true
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
      vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },
  sources = cmp.config.sources({
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- конфиг для ИИ автодополнений
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
})

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- ...

  sources = cmp.config.sources({
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- сюда
  }, {
    { name = 'buffer' },
  })
})

-- инициализация LSP для различных ЯП
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local function config(_config)
  return vim.tbl_deep_extend('force', {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }, _config or {})
end

-- PHP LSP
lspconfig.intelephense.setup{
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = util.root_pattern("composer.json", ".git")
}

-- иницализация gopls LSP для Go
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
lspconfig.gopls.setup(config({
  on_attach = on_attach,
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'go.mod' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  }
}))
