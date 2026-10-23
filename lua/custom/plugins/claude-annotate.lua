-- Annotate Claude Code's replies: Claude Code's ctrl+g opens the review instead of the
-- prompt editor. The module is linked into lua/ by claude-annotate's install.sh, and is
-- missing until then; linked alone, without the plugin's plugin/ file, it needs this setup.

local ok, annotate = pcall(require, 'claude-annotate')
if ok then annotate.setup {} end
