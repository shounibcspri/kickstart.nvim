-- Highlight todo, notes, etc in comments
-- https://github.com/folke/todo-comments.nvim

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/todo-comments.nvim',
}

---@diagnostic disable-next-line: missing-fields
require('todo-comments').setup { signs = false }
