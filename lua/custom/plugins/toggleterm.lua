--- Configure ToggleTerm

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

local opencode = Terminal:new {
  cmd = 'opencode',
  hidden = true,
  direction = 'float',
}

local term = Terminal:new {}

vim.keymap.set('n', '<leader>lg', function() lazygit:toggle() end, { noremap = true, silent = true, desc = 'Toggle LazyGit' })

vim.keymap.set('n', '<leader>to', function() opencode:toggle() end, { noremap = true, silent = true, desc = '[T]oggle [O]penCode' })

vim.keymap.set('n', '<leader>tt', function() term:toggle() end, { noremap = true, silent = true, desc = '[T]oggle [T]erminal' })
