return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
      -- ----------------------------------------------------------------------------------
      -- before the above fix can process, make sure to install gcc, install using mingw.
      -- fix treesitter could not compile in windows.
      -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1985#:~:text=and%20its%20quite%20easy.%20Have%20a%20good%20day%20%F0%9F%99%8F-,Worked%20perfectly%20for%20me%20on%20Windows!!!%20Thank%20you,-The%20only%20change%20I%20did%20was%3A%0Arequire
      -- make sure to install scoop and then zig.
      require("nvim-treesitter.install").compilers = {"zig"}
      -- ----------------------------------------------------------------------------------
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"lua","php", "javascript"},
        highlight = {enable = true},
        indent = {enable = true},
      })
  end
}

