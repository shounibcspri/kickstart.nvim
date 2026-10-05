-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command in the config to whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

---@module 'lazy'
---@type LazySpec
return {
  'catppuccin/nvim',
  name = 'catppuccin', -- the repo is called `nvim`, so give lazy a usable directory name
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
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
  end,
}
