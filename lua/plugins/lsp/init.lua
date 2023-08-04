local M = {}
local Util = require("core.utils")
local plugins = {}

local base = vim.fn.stdpath("config") -- default: $XDG_CONFIG_HOME/nvim (i.e. `.config/nvim`)
local files = Util.scandir(base .. "/lua/plugins/lsp", "init*") -- ignores init.lua

for _, v in ipairs(files) do
	local module = string.sub(v, 1, #v - #".lua") -- e.g. `lsp_lines.lua`  ==> `lsp_lines`
	table.insert(plugins, module)
end

for _, v in ipairs(plugins) do
	local status_ok, plug = pcall(require, "plugins.lsp." .. v)
	if not status_ok then
		return
	end
	table.insert(M, plug)
end

return M
