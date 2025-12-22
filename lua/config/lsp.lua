local M = {}

local function prequire(mod)
  local ok, m = pcall(require, mod)
  return ok and m or nil
end

local function lsp_capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()

  -- If cmp-nvim-lsp is installed, merge completion capabilities.
  local cmp_lsp = prequire("cmp_nvim_lsp")
  if cmp_lsp and cmp_lsp.default_capabilities then
    caps = cmp_lsp.default_capabilities(caps)
  end

  return caps
end

local function setup_ui()
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { source = true },
  })
end

local function setup_keymaps()
  local group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(ev)
      local bufnr = ev.buf
      local opts = { buffer = bufnr, silent = true }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

      vim.keymap.set("n", "<leader>s", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "x" }, "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

      vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, opts)
    end,
    desc = "LSP: buffer-local keymaps",
  })
end

function M.setup()
  setup_ui()
  setup_keymaps()

  vim.lsp.config("*", {
    capabilities = lsp_capabilities(),
  })

  vim.lsp.enable({
    "bashls",
    "buf_ls",
    "docker_compose_language_service",
    "dockerls",
    "jsonls",
    "lua_ls",
    "pyright",
    "ruff",
    "taplo",
  })
end

return M
