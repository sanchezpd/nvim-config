return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", lazy = false },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        {
          "saadparwaiz1/cmp_luasnip",
          "rafamadriz/friendly-snippets",
        },
      },
    },
  },
  config = function()
    local cmp = require("cmp")

    local function match_at_cursor(pattern)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local text = vim.api.nvim_get_current_line():sub(col, col - 1 + pattern:len())
      return text == pattern
    end

    cmp.setup({
      sources = cmp.config.sources(
        {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        {
          { name = "buffer" },
        }
      ),
      mapping = {
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),

        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = "insert" })
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = "insert" })
          else
            cmp.complete()
          end
        end),

        ["<CR>"] = cmp.mapping(function(fallback)
          if not cmp.confirm({ select = false }) then
            fallback()
            if match_at_cursor("></") then
              local keys = vim.api.nvim_replace_termcodes("<C-o>O", true, true, true)
              vim.api.nvim_feedkeys(keys, "n", false)
            end
          end
        end),
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = { border = "rounded", scrollbar = "║" },
        documentation = { border = "rounded", scrollbar = "║" },
      },
    })
  end,
}
