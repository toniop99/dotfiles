-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if not vim.g.vscode then
  -- ref: https://github.com/LazyVim/LazyVim/discussions/645
  -- the following settins assume you've installed the vscode-debug-php adapter using mason.nvim
  local dap = require("dap")
  local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
  dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { path .. "/extension/out/phpDebug.js" },
  }

  dap.configurations.php = {
    {
      type = "php",
      request = "launch",
      name = "AvaiBook - App Legacy",
      port = 9000,
      pathMappings = {
        ["/var/www/html"] = "${workspaceFolder}",
      },
    },
    {
      type = "php",
      request = "launch",
      name = "AvaiBook - App Symf",
      port = 9000,
      pathMappings = {
        ["/usr/src/app"] = "/home/toniop/dev/avaibook/avaibook-vacacional-symfony",
      },
    },
  }

  --dap.defaults.php.exception_breakpoints = { "Notice", "Warning", "Error", "Exception" }
end
