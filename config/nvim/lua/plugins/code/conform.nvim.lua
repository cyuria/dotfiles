---@type LazySpec
return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				["*"] = { "codespell" },
				bash = { "shellcheck" },
				c = { "clang-format", lsp_format = "fallback" },
				cpp = { "clang-format", lsp_format = "fallback" },
				css = { "prettierd", "prettier", stop_after_first = true },
				d = { "dfmt", lsp_format = "fallback" },
				go = { "goimports", "gofmt", lsp_format = "fallback" },
				html = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				rust = { "rustfmt", lsp_format = "fallback" },
				sh = { "shellcheck" },
				tex = { "tex-fmt" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typst = { "prettypst" },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				zig = { "zigfmt" },
				zsh = { "shellcheck" },
			},
		},
	},
}
