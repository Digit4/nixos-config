return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 0.75 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
					{ section = "startup" },
				},
			
		},
		explorer = { enabled = true },
		indent = { enabled = false },
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		dim = { enabled = true },
	},
}
