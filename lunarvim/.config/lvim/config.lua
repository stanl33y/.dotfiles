lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula_pro"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<C-F>f"] = ":CtrlSF "
lvim.keys.normal_mode["<C-F>t"] = ":CtrlSFToggle<cr>"

-- lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c_sharp",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Prettier configuration
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "json",
      "markdown",
    },
  },
}

-- ESLint
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    exe = "eslint",
    filetypes = {
      "javascriptreact",
      "javascript",
      "typescriptreact",
      "typescript",
      "vue",
    },
  },
}

-- Additional Plugins
lvim.plugins = {
   {"dracula/vim"}
   ,{"editorconfig/editorconfig-vim"}
   ,{"tpope/vim-dadbod"}
   ,{"kristijanhusak/vim-dadbod-ui"}
   ,{"tpope/vim-dotenv"}
   ,{"easymotion/vim-easymotion"}
   ,{"neoclide/coc.nvim", branch = 'release'}
   ,{"terryma/vim-multiple-cursors"}
   ,{"dyng/ctrlsf.vim"}
}

vim.g.coc_global_extensions = {"coc-db"};

vim.g.db_ui_auto_execute_table_helpers = 0
vim.g.db_ui_execute_on_save = 1
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = 'right'
vim.g.db_ui_save_location = '~/queries/'

vim.g.db_ui_table_helpers = {
   mysql = {
     Count = 'select count(*) from {table};',
     First = 'select * from {table} limit 1;'
   }
 }
