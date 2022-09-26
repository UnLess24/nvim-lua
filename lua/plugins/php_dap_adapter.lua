require('dap').adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/y.khaydanov/.local/share/nvim/vscode-php-debug/out/phpDebug.js' }
}

require('dap').configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
    hostname = 'crpt.my',
    log = true,
    serverSourceRoot = '/code',
    localSourceRoot = '/Users/y.khaydanov/Platform/code/'
  }
}
