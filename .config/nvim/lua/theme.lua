-- theme
vim.o.termguicolors = true -- comment for colorscheme wal

require('onedark').setup {
    style = 'darker',
    transparent = 'true',
}
require('onedark').load()
-- tokyonight
--[[ vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_functions = true ]]

-- vim.cmd [[colorscheme tokyonight]]

-- comment for  colorscheme wal
require('lualine').setup{
  options = {
    theme = 'onedark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = true} },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  },
  extensions = { 'fzf' }
}
