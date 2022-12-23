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

vim.cmd("colorscheme terafox")
