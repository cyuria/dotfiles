
-- configure persistent loading mappings
vim.keymap.set("n", "<F8>", function()
    require('persistence').load()
end, {})
vim.keymap.set("n", "<F9>", function()
    require('persistence').load({ last = true })
end, {})

