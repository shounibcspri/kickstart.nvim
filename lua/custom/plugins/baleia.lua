-- Turns the ANSI escape codes in a `capture-pane -e` snapshot into real
-- highlights, so a claude-annotate buffer keeps Claude's bold and colours.
-- No setup here: claude-annotate sets it up on the popup's buffer only.

vim.pack.add { 'https://github.com/m00qek/baleia.nvim' }
