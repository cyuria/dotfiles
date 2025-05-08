-- ensure the leader key doesn't do anything else
vim.keymap.set('n', '<leader>', '<nop>')

if require 'dependencies'.enable_plugins then
    -- undo tree
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

    -- zen mode
    vim.keymap.set('n', '<leader>z', vim.cmd.ZenMode)

    -- persistence and session management
    vim.keymap.set("n", "<leader>sd", function () require('persistence').load() end, {})
    vim.keymap.set("n", "<leader>sl", function () require('persistence').load({ last = true }) end, {})
    vim.keymap.set("n", "<leader>ss", function () require('persistence').select() end, {})

    -- trouble.nvim
    vim.keymap.set("n", "<leader>xx", vim.cmd.Trouble, { silent = true })
    vim.keymap.set("n", "<leader>xd", function () vim.cmd.Trouble("diagnostics toggle") end)
    vim.keymap.set("n", "<leader>xt", function () vim.cmd.Trouble("todo toggle") end)
    vim.keymap.set("n", "<leader>xl", function () vim.cmd.Trouble("loclist toggle") end)
    vim.keymap.set("n", "<leader>xq", function () vim.cmd.Trouble("quickfix toggle") end)
    vim.keymap.set("n", "<leader>xr", function () vim.cmd.Trouble("lsp_references toggle") end)

    -- telescope.nvim
    vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
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

