local binary = "gomodifytags"

---@param action "add"|"remove"
---@param tag string
---@param opts { transform?: string, skip_unexported?: boolean, override?: boolean }
local function modify_tags(action, tag, opts)
	if vim.fn.executable(binary) == 0 then
		vim.notify(binary .. ": command not found", vim.log.levels.ERROR)
		return
	end

	local buf = vim.api.nvim_get_current_buf()
	if vim.bo[buf].modified then
		vim.cmd.write() -- gomodifytags works on the file on disk
	end

	local offset = vim.fn.line2byte(vim.fn.line(".")) + vim.fn.col(".") - 1

	-- stylua: ignore
	local args = {
		binary,
		"-file", vim.api.nvim_buf_get_name(buf),
		"-offset", tostring(offset),
		string.format("-%s-tags", action), tag,
		"-w",
	}
	if opts.transform then
		vim.list_extend(args, { "-transform", opts.transform })
	end
	if opts.skip_unexported then
		table.insert(args, "-skip-unexported")
	end
	if opts.override then
		table.insert(args, "-override")
	end

	vim.system(args, { text = true }, function(res)
		vim.schedule(function()
			if res.code ~= 0 then
				vim.notify(vim.trim(res.stderr or ""), vim.log.levels.ERROR)
				return
			end
			if vim.api.nvim_buf_is_valid(buf) then
				vim.api.nvim_buf_call(buf, function()
					vim.cmd("checktime")
				end)
			end
		end)
	end)
end

vim.api.nvim_buf_create_user_command(0, "GoAddTags", function(cmd)
	modify_tags("add", cmd.args, { transform = "snakecase", override = true })
end, { nargs = 1, desc = "Add struct tags" })

vim.api.nvim_buf_create_user_command(0, "GoRemoveTags", function(cmd)
	modify_tags("remove", cmd.args, { override = true })
end, { nargs = 1, desc = "Remove struct tags" })

vim.keymap.set("n", "<leader>at", "<cmd>GoAddTags json<CR>", { buffer = true, desc = "Add JSON tags" })
vim.keymap.set("n", "<leader>rt", "<cmd>GoRemoveTags json<CR>", { buffer = true, desc = "Remove JSON tags" })
