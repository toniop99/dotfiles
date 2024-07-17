local project_root = vim.fn.getcwd()

local function contains(mainString, subString)
  return mainString:find(subString, 1, true) ~= nil
end

local function get_phpunit_cmd()
  if contains(project_root, "avaibook-vacacional-symfony") then
    return "/home/toniop/.config/nvim/bin/dphpunit"
  else
    return "vendor/bin/phpunit" -- Default command for php
  end
end

return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "olimorris/neotest-phpunit",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-phpunit")({
            env = function()
              if contains(project_root, "avaibook-vacacional-symfony") then
                return {
                  CONTAINER = "avapi_php",
                  REMOTE_PHPUNIT_BIN = "vendor/bin/simple-phpunit",
                }
              else
                return {}
              end
            end,
            phpunit_cmd = get_phpunit_cmd,
            root_files = { "composer.json", "phpunit.xml", ".gitignore" },
            filter_dirs = { ".git", "node_modules", "vendor" },
          }),
          require("neotest-jest")({
            jestCommand = "npm test --", -- Command to run Jest
            jestConfigFile = "jest.config.js", -- Path to your Jest config file
            cwd = function()
              return vim.fn.getcwd() -- Set the current working directory for Jest
            end,
          }),
        },
      })
    end,
  },
}
