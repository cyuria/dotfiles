---@type LazySpec
return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		cmd = "Mason",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
			"blink.cmp",

			"p00f/clangd_extensions.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = { "VeryLazy" },
		opts = {},
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
