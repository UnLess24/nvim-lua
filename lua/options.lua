local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
-- Направление перевода с русского на английский
g.translate_source = 'ru'
g.translate_target = 'en'
-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
g.tagbar_compact = 1
g.tagbar_sort = 0

-- Конфиг ale + eslint
g.ale_fixers = { javascript= { 'eslint' } }
g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'
g.ale_fix_on_save = 1
-- Запуск линтера, только при сохранении
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 3

g.encoding='utf-8'
g.fileencoding='utf-8'

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
opt.colorcolumn = '120'             -- Разделитель на n символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
opt.number = true                   -- Включаем нумерацию строк
opt.nuw = 6                         -- Количество столбцов пространства номеров строк
opt.relativenumber = true           -- Вкл. относительную нумерацию строк
opt.so=999                          -- Курсор всегда в центре экрана
opt.undofile = true                 -- Возможность отката назад
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз
opt.mouse = ''                      -- отключение мыши
-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
g.ayucolor='light'
cmd('colorscheme ayu')
-- " IndentLine {{
g.indentLine_char = ''
g.indentLine_first_char = ''
g.indentLine_showFirstIndentLevel = 1
g.indentLine_setColors = 1
-- " }}
-- opt.background = 'light' -- 'dark'
-- cmd('colorscheme gruvbox')
-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

cmd [[autocmd FileType php setlocal indentexpr =]]
cmd [[autocmd FileType php setlocal autoindent]]
cmd [[autocmd FileType php setlocal smartindent]]
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
