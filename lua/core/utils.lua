local M = {}

--scans the specified directory while ignoring any file matching the ignore pattern.
--returns a table containing the contents of the directory
---@param directory string
---@param ignore? string this is optional
---@return table
M.scandir = function(directory, ignore)
	local i, t = 0, {}
	ignore = ignore or ""
	local pfile = io.popen("ls " .. directory .. " --ignore=" .. ignore)
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

return M
