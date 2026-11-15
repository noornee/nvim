-- Colors #rrggbb codes in the Claude Code terminal (enabled from plugins/claudecode.lua).
-- nvim-highlight-colors handles code files but skips terminal buffers.
return {
	"nvim-mini/mini.hipatterns",
	lazy = true, -- loaded when the Claude terminal opens
	opts = {
		highlighters = {}, -- nothing globally; only enabled per buffer
	},
}