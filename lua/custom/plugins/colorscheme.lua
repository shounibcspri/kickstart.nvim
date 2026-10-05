-- You can easily change to a different colorscheme.
-- Change the plugin below, and the `colorscheme` command to that scheme's name.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

-- the repo is called `nvim`, so give it a usable directory name
vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  flavour = 'mocha', -- 'latte' | 'frappe' | 'macchiato' | 'mocha'
  transparent_background = true, -- let ghostty's background-opacity show through
  styles = {
    comments = {}, -- Disable italics in comments
  },
  -- transparent_background leaves floats opaque, so clear them too
  custom_highlights = function(colors)
    return {
      NormalFloat = { bg = colors.none },
      FloatBorder = { bg = colors.none },
    }
  end,
}

-- load the flavour by name, so a light `background` can never flip us to latte
vim.cmd.colorscheme 'catppuccin-mocha'
