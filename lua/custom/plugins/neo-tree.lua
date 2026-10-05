-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  window = {
    width = 32,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = true,
      hide_gitignored = true,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}
