-- ensure the leader key doesn't do anything else
vim.keymap.set('n', '<leader>', '<nop>')

-- google search for text with "<leader>?"
vim.keymap.set('n', '<leader>?', function ()
    local old_opfunc = vim.go.operatorfunc
    _G.op_func_googlesearch = function ()
        require('config.functions').googleSearch(
            vim.fn.getpos("'["),
            vim.fn.getpos("']")
        )
        vim.go.operatorfunc = old_opfunc
    end
    vim.go.operatorfunc = 'v:lua.op_func_googlesearch'
    vim.api.nvim_feedkeys('g@', 'n', false)
end, {})
vim.keymap.set('v', '<leader>?', function ()
    -- Need to exit visual mode first for marks to work
    local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
    vim.api.nvim_feedkeys(esc, 'x', false)
    require('config.functions').googleSearch(
        vim.fn.getpos("'<"),
        vim.fn.getpos("'>")
    )
end, {})

if require 'dependencies'.enable_plugins then
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

    vim.keymap.set('n', '<leader>zm', vim.cmd.ZenMode)

    -- configure persistent loading mappings
    vim.keymap.set("n", "<F8>", function () require('persistence').load() end, {})
    vim.keymap.set("n", "<F9>", function () require('persistence').load({ last = true }) end, {})

    -- trouble.nvim key mappings
    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true })
    vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics<cr>", { silent = true })
    vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo<cr>", { silent = true })
    vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true })
    vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true })
    vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", { silent = true })

    -- configure telescope.nvim
    vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
    vim.keymap.set('n', '<leader>fw', require('telescope.builtin').lsp_workspace_symbols)
    vim.keymap.set('n', '<leader>fv', require('telescope.builtin').treesitter)
    vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
    vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
    vim.keymap.set('n', '<leader>ft', require('telescope').extensions['todo-comments'].todo)
    vim.keymap.set('n', '<leader>fc', require('telescope.builtin').colorscheme)
    vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args)
    vim.keymap.set('n', '<leader>fl', require('telescope.builtin').git_commits)
    vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics)
    vim.keymap.set('n', '<leader>fD', function () require('telescope.builtin').diagnostics({ bufnr = 0 }) end)
    vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume)
    vim.keymap.set('n', '<leader>fa', require('telescope.builtin').builtin)
    vim.keymap.set('n', '<leader>fn', require('telescope').extensions.notify.notify)
end

