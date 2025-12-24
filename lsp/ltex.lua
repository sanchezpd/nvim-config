vim.lsp.config("ltex", {
  update_in_instert = true,
  on_init = function()
    require("ltex_extra").setup({
      load_langs = { "en-US" },
      init_check = true,
      path = vim.fn.stdpath("cache") .. "/ltex_dictionary",
      log_level = "none",
    })
  end,
  settings = {
    ltex = {
      language = "en-US",
    }
  }
})
