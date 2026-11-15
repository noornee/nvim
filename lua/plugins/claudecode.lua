return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	init = function()
		vim.api.nvim_create_autocmd("TermOpen", {
			group = vim.api.nvim_create_augroup("ClaudeTermMaps", { clear = true }),
			callback = function(ev)
				-- Buffer names look like term://{cwd}//{pid}:{cmd}. Match on the command
				-- only, so a shell opened in a path containing "claude" isn't caught.
				local cmd = vim.api.nvim_buf_get_name(ev.buf):match("^term://.-//%d+:(.*)$")
				if not (cmd and cmd:find("claude", 1, true)) then
					return
				end
				local function map(lhs, rhs, desc)
					vim.keymap.set("t", lhs, rhs, { buffer = ev.buf, desc = desc })
				end
				-- <C-n> → normal mode
				map("<C-n>", [[<C-\><C-n>]], "Terminal -> normal mode")
				-- Jump from the Claude terminal (left split) to the window on its right
				map("<C-l>", [[<C-\><C-n><C-w>l]], "Leave terminal -> right window")
			end,
		})
	end,
	opts = {
		terminal = {
			split_side = "left",
			split_width_percentage = 0.30,
			-- Always start Claude at the git root, so --continue/--resume find the same
			-- conversations no matter which subfolder Neovim is in.
			git_repo_cwd = true,
		},
		diff_opts = {
			-- Open each proposed edit in its own tab, so the main layout isn't disturbed.
			open_in_new_tab = true,
			-- Keep the diff tab to just the diff; Claude stays in the original tab.
			hide_terminal_in_new_tab = true,
		},
	},
	-- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
	-- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
	-- spec defers loading until a <leader>a* mapping is pressed and the commands
	-- would not exist yet.
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeSendText",
		"ClaudeCodeTreeAdd",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
		"ClaudeCodeOpen",
		"ClaudeCodeClose",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
		"ClaudeCodeCloseAllDiffs",
	},
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		{ "<leader>aD", "<cmd>ClaudeCodeCloseAllDiffs<cr>", desc = "Close all diffs" },
	},
}
