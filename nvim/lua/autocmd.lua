local api = vim.api

api.nvim_create_autocmd({"BufReadPost, FileReadPost"}, {
    pattern = {"*"},
    command = "normal zR",
})
