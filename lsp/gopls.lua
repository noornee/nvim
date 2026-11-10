return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { ".git", "go.mod" },
	settings = {
		gopls = {
			vulncheck = "Imports",
			gofumpt = true,
			staticcheck = true,
			directoryFilters = {
				"-.git",
				"-uploads",
				"-.idea",
				"-tmp",
				"-logs",
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
