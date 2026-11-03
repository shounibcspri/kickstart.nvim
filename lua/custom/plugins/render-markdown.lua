-- Render markdown in the buffer: headings, tables, lists, code blocks
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- From the personal fork, for its branch's fix to wrapped rows in indented tables, which
-- claude-annotate's tables all are
vim.pack.add {
  { src = 'https://github.com/shounibcspri/render-markdown.nvim', version = 'fix/indented-table-wrap' },
}
require('render-markdown').setup {
  -- no numbered level icon in place of the #s: next to claude-annotate's "Response -2" it reads as a count
  heading = { icons = { '' }, sign = false },
}
