-- Render markdown in the buffer: headings, tables, lists, code blocks
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {
  -- no numbered level icon in place of the #s: next to claude-annotate's "Response -2" it reads as a count
  heading = { icons = { '' }, sign = false },
}
