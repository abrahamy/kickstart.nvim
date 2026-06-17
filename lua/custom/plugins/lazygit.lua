--- Configure LazyGit

vim.pack.add {
  { src = 'https://github.com/akinsho/toggleterm.nvim', version = vim.version.range '*' },
}

require('toggleterm').setup {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  hidden = true,
  direction = 'float',
}

vim.keymap.set('n', '<leader>lg', function() lazygit:toggle() end, { noremap = true, silent = true, desc = 'Toggle LazyGit' })
