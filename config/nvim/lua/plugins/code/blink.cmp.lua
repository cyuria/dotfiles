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
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },
				["<C-CR>"] = { "select_and_accept" },

				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },

				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-k>"] = { "show_signature" },
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
