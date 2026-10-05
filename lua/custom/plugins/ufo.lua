-- Better folds with preview, powered by treesitter/LSP fold providers
-- https://github.com/kevinhwang91/nvim-ufo

vim.pack.add {
  'https://github.com/kevinhwang91/promise-async',
  'https://github.com/kevinhwang91/nvim-ufo',
}

-- ufo requires these options to be set before its setup, so they live here
-- rather than in init.lua — that keeps everything fold-related in one file.
-- See `:help ufo` and the "Minimal configuration" section of the README.

-- Start with everything unfolded; ufo needs a large foldlevel to work.
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Show a fold column in the gutter. Set to '0' if you'd rather not spend
-- the extra column (folds still work, you just lose the click targets).
vim.o.foldcolumn = '1'

-- NOTE: the README's recommended `fillchars` uses Nerd Font glyphs. This
-- config sets `vim.g.have_nerd_font = false`, so use plain fallbacks unless
-- you flip that flag in init.lua.
vim.opt.fillchars:append(vim.g.have_nerd_font and {
  eob = ' ',
  fold = ' ',
  foldopen = '',
  foldsep = ' ',
  foldclose = '',
} or {
  eob = ' ',
  fold = ' ',
  foldopen = '-',
  foldsep = ' ',
  foldclose = '+',
})

local ufo = require 'ufo'

vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds, { desc = 'Open folds except kinds' })
vim.keymap.set('n', 'zm', ufo.closeFoldsWith, { desc = 'Close folds with level' })
vim.keymap.set('n', 'zK', function()
  -- Peek inside a closed fold; falls back to hover when not on a fold.
  if not ufo.peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end
end, { desc = 'Peek fold under cursor' })

ufo.setup {
  -- Prefer treesitter fold queries, fall back to indent for filetypes
  -- without a folds.scm. ufo ships its own queries, so this works
  -- independently of the nvim-treesitter plugin.
  provider_selector = function(_, _, _) return { 'treesitter', 'indent' } end,

  -- Show how many lines a closed fold is hiding.
  fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
    local suffix = ('  ⋯ %d lines'):format(end_lnum - lnum)
    local target_width = width - vim.fn.strdisplaywidth(suffix)
    local cur_width = 0
    local result = {}

    for _, chunk in ipairs(virt_text) do
      local chunk_text = chunk[1]
      local chunk_width = vim.fn.strdisplaywidth(chunk_text)
      if target_width > cur_width + chunk_width then
        table.insert(result, chunk)
      else
        chunk_text = truncate(chunk_text, target_width - cur_width)
        table.insert(result, { chunk_text, chunk[2] })
        chunk_width = vim.fn.strdisplaywidth(chunk_text)
        -- Pad if truncation landed mid-character
        if cur_width + chunk_width < target_width then suffix = suffix .. (' '):rep(target_width - cur_width - chunk_width) end
        break
      end
      cur_width = cur_width + chunk_width
    end

    table.insert(result, { suffix, 'MoreMsg' })
    return result
  end,
}
