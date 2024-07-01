return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
            require('kanagawa').setup({
        transparent = true, -- 투명도 설정 활성화
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none' -- Gutter 배경도 투명하게 설정
              }
            }
          }
        }
      })
      vim.cmd.colorscheme "kanagawa-dragon"
    end
  }
}
