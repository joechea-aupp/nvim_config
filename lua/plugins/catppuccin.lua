return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    -- require("catppuccin").setup() is not required or optional here because this function is already call main setup()
    require("catppuccin").setup({
      flavour = "mocha",
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
