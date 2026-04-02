return {
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "7caec274fd19c12b55902a5b795100d21531391f",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      local ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "css",
        "diff",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "git_rebase",
        "go",
        "gomod",
        "helm",
        "html",
        "ini",
        "javascript",
        "jinja_inline",
        "json",
        "jsx",
        "kotlin",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "proto",
        "python",
        "query",
        "regex",
        "requirements",
        "rust",
        "scheme",
        "sql",
        "terraform",
        "tmux",
        "toml",
        "typescript",
        "yaml",
        "zig",
        "zsh",
      }
      vim.schedule(function() ts.install(ensure_installed) end)

      local augroup = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })
      local MAX_BYTES = 1024 * 1024

      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(args)
          local buf = args.buf

          local name = vim.api.nvim_buf_get_name(buf)
          if name ~= "" then
            local ok, stat = pcall(vim.uv.fs_stat, name)
            if ok and stat and stat.size > MAX_BYTES then
              return
            end
          end

          pcall(vim.treesitter.start, buf)
        end,
        desc = "Start Treesitter for buffer (if available)",
      })

    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
      })

      local sel = require("nvim-treesitter-textobjects.select")

      -- Textobject selection maps
      -- Notes:
      -- - { "x", "o" } means: visual mode and operator-pending mode
      local function map(lhs, capture, desc)
        vim.keymap.set({ "x", "o" }, lhs, function()
          sel.select_textobject(capture, "textobjects")
        end, { silent = true, desc = desc })
      end

      map("if", "@function.inner", "TS textobj: function (inner)")
      map("af", "@function.outer", "TS textobj: function (outer)")

      map("ip", "@parameter.inner", "TS textobj: parameter (inner)")
      map("ap", "@parameter.outer", "TS textobj: parameter (outer)")

      map("ii", "@conditional.inner", "TS textobj: conditional (inner)")
      map("ai", "@conditional.outer", "TS textobj: conditional (outer)")

      map("il", "@loop.inner", "TS textobj: loop (inner)")
      map("al", "@loop.outer", "TS textobj: loop (outer)")

      map("ic", "@class.inner", "TS textobj: class (inner)")
      map("ac", "@class.outer", "TS textobj: class (outer)")

      map("i=", "@assignment.inner", "TS textobj: assignment (inner)")
      map("a=", "@assignment.outer", "TS textobj: assignment (outer)")
      map("l=", "@assignment.lhs", "TS textobj: assignment LHS")
      map("r=", "@assignment.rhs", "TS textobj: assignment RHS")

      map("it", "@type.inner", "TS textobj: type (inner)")
    end,
  },
}
