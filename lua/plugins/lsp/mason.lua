return {
  "mason-org/mason.nvim",
  event = "VeryLazy",
  config = function()
    require("mason").setup({})

    local registry = require("mason-registry")

    local ensure_installed = {
      "bash-language-server",
      "buf",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "json-lsp",
      "lua-language-server",
      "ltex-ls",
      "pyright",
      "ruff",
      "taplo",
    }

    for _, name in ipairs(ensure_installed) do
      local ok, pkg = pcall(registry.get_package, name)
      if ok and pkg and not pkg:is_installed() then
        pkg:install()
      end
    end
  end,
}
