---@type LazySpec
return {
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "VeryLazy" },
		dependencies = {
			"LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		version = "*",
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<C-enter>"] = { "select_and_accept" },
			},
			completion = {
				accept = { auto_brackets = { enabled = true } },
				documentation = { auto_show = true },
				ghost_text = { enabled = true },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				prebuilt_binaries = {
					download = true,
				},
			},
			snippets = {
				preset = "luasnip",
			},
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
