local neovim = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

local ghost_gang = {
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                                                              ]],
  [[                                    ██████                                    ]],
  [[                                ████▒▒▒▒▒▒████                                ]],
  [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
  [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
  [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
  [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
  [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
  [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
  [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
  [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
  [[                        ██      ██      ████      ████                        ]],

}


return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = neovim
    dashboard.section.header.opts.hl = "Title"

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼   Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("s", "   Find word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("o", "   Last cursor position", "<cmd>normal! `0<CR>"),
      dashboard.button("t", "   Nvim-Tree", "<cmd>NvimTreeToggle<CR>"),
      { type = "padding", val = 1 },
      dashboard.button("l", "󰒲   Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button("m", "󱌣   Mason", "<cmd>Mason<CR>"),
      dashboard.button("p", "󱄽   Update parsers", "<cmd>TSUpdate<CR>"),
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local count = (math.floor(stats.startuptime * 100) / 100)
        dashboard.section.footer.val = {
          " ",
          "󱐌 Startup: " .. count .. " ms.",
          " ",
        }
        dashboard.section.footer.opts.hl = "Identifier"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
