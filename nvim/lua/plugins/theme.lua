require('nightfox').setup({
    options = {
        styles = {
            conditionals = "italic",
            keywords = "bold",
            types = "bold",
            operators = "bold",
        }
    }
})

vim.cmd("colorscheme nightfox")
vim.g.lightline = { colorscheme = "nightfox" }
