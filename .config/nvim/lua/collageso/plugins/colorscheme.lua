return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('kanagawa').setup({
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "dragon"
      },
      transparent = true,
    })
    vim.cmd("colorscheme kanagawa")
  end,
}
