-- Sticky header showing the enclosing scope (parent keys in JSON/YAML, etc.)
-- https://github.com/nvim-treesitter/nvim-treesitter-context

vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }

require('treesitter-context').setup {
  max_lines = 5, -- how many context lines to show at most (0 = unlimited)
  multiline_threshold = 1, -- collapse multiline nodes to a single line
}

vim.keymap.set('n', '[c', function() require('treesitter-context').go_to_context(vim.v.count1) end, { desc = 'Jump to [c]ontext (upper key)' })
