local vim = vim

local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
    return
end


vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end, {})

