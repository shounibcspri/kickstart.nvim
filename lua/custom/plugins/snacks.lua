-- Draw images in the buffer: under their line in markdown, and in place of an opened image file
-- https://github.com/folke/snacks.nvim/blob/main/docs/image.md
-- Only the image module is enabled. It draws through the kitty graphics protocol, which Ghostty
-- speaks, and needs tmux's allow-passthrough on. PNG works as is; every other format (svg, jpg)
-- goes through ImageMagick's `magick`. Check both with :checkhealth snacks
vim.pack.add { 'https://github.com/folke/snacks.nvim' }
require('snacks').setup {
  image = { enabled = true },
}
