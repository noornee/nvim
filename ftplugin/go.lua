local M = {}

M.GoModifyTags = {
	-- this is the executable name
	binary = "gomodifytags",

	-- checks if the gomodifytags executable is present
	is_available = function()
		if vim.fn.executable(M.GoModifyTags.binary) == 0 then
			vim.notify(M.GoModifyTags.binary .. ": command not found", vim.log.levels.ERROR)
			return false
		end
		return true
	end,

	-- executes gomodifytags
	run = function(action, tag, opts)
		if not M.GoModifyTags.is_available() then
			return
		end

		local filepath = vim.fn.expand("%:p")
		local offset = vim.fn.line2byte(vim.fn.line(".")) + vim.fn.col(".") - 1

		-- stylua: ignore
		local args = {
			M.GoModifyTags.binary,
			"-file", filepath,
			"-offset", tostring(offset),
			string.format("-%s-tags", action), tag,
		}

		if opts.transform then
			table.insert(args, "-transform")
			table.insert(args, opts.transform)
		end

		if opts.skip_unexported then
			table.insert(args, "-skip-unexported")
		end

		if opts.override then
			table.insert(args, "-override")
		end

		table.insert(args, "-w") -- write changes

		vim.fn.jobstart(args, {
			on_exit = function()
				vim.cmd("edit!") -- reload file
			end,
			on_stderr = function(_, msg)
				if #msg > 0 and msg[1] ~= "" then
					vim.notify(msg[1], vim.log.levels.ERROR)
				end
			end,
		})
	end,
}

vim.api.nvim_create_user_command("GoAddTags", function(opts)
	M.GoModifyTags.run("add", opts.args, {
		transform = "snakecase",
		skip_unexported = false, -- set to true if you want to skip unexported fields
		override = true, -- replace existing tags
	})
end, { nargs = 1 })

vim.api.nvim_create_user_command("GoRemoveTags", function(opts)
	M.GoModifyTags.run("remove", opts.args, { override = true })
end, { nargs = 1 })

vim.keymap.set("n", "<leader>at", ":GoAddTags json<CR>", { buffer = true, desc = "Add JSON tags" })
vim.keymap.set("n", "<leader>rt", ":GoRemoveTags json<CR>", { buffer = true, desc = "Remove JSON tags" })
