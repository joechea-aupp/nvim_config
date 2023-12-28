return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua, -- for lua 
        null_ls.builtins.formatting.prettier, -- for js 
        null_ls.builtins.formatting.black, -- for python 
        null_ls.builtins.formatting.isort, -- for python 
        null_ls.builtins.diagnostics.eslint_d, -- for js
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
