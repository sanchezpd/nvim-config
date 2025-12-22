local rosewater = '#f4dbd6'

return {
  'michaelrommel/nvim-silicon',
  cmd = 'Silicon',
  main = 'nvim-silicon',
  keys = {
    { "<leader>c", ":Silicon<CR>", mode = "v", silent = true, desc = "Silicon: screenshot selection", },
  },
  opts = {
    background = rosewater,
    font = 'MesloLGL Nerd Font Mono',
    language = function()
      return vim.bo.filetype
    end,
    line_offset = function(args)
      return args.line1
    end,
    pad_horiz = 5,
    pad_vert = 5,
    shadow_blur_radius = 0,
    theme = 'Catppuccin Macchiato',
    to_clipboard = true,
    window_title = function()
      return vim.fn.fnamemodify( vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":.")
    end,
  },
}
