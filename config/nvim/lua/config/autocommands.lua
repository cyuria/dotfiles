local augroup = vim.api.nvim_create_augroup("openBufOpts", {})

-- Repoen files with cursor in last location
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = augroup,
	desc = "return cursor to where it was last time closing the file",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd({ "Colorscheme" }, {
	group = augroup,
	desc = "cache the neovim color scheme whenever it changes for persistence",
	callback = function()
		local file_path = vim.fn.stdpath("data") .. "/saved_colourscheme"
		local file, open_err = vim.uv.fs_open(file_path, "w", 432)
		if open_err ~= nil then
			error(open_err .. " Could not open file '" .. file_path .. "' for writing to cache color scheme")
		end
		assert(file ~= nil)
		local _, write_err = vim.uv.fs_write(file, vim.g.colors_name)
		if write_err ~= nil then
			error(write_err .. " Could not write to file '" .. file_path .. "' to cache color scheme")
		end
		local _, close_err = vim.uv.fs_close(file)
		if close_err ~= nil then
			error(close_err .. " Could not close file '" .. file_path .. "' to cache color scheme")
		end
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup,
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if not pcall(vim.treesitter.language.inspect, lang) then
			return
		end

		vim.treesitter.start()
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo.indentexpr = "v:la.require'nvim-tresitter'.indentexpr()"
	end,
})

if require("config.dependencies").enable then
	vim.api.nvim_create_autocmd({ "BufLeave" }, {
		group = augroup,
		command = "NvimcordUpdate",
	})
	vim.api.nvim_create_autocmd({ "DirChanged" }, {
		group = augroup,
		callback = function()
			local wsname = require("nvimcord.workspace").get_name()
			require("nvimcord.discord").config.workspace_name = wsname
		end,
	})
end
