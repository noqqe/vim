-- Save on logs
vim.lsp.set_log_level("off")

-- Configure Languages
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    },
  },
})

-- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md
vim.lsp.config('terraformls', {
  settings = {
    root_dir = ".git",
  },
})

vim.lsp.config('ansiblels', {
  settings = {
    single_file_detection = true
  },
})

-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        composites = false,
      },
      staticcheck = true,
    },
  },
})

-- typst lsp
vim.lsp.config('tinymist', {
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable"
  },
})

return {
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    config = function()
      require('mason').setup()
    end,
    keys = {
      "<leader>M", "<cmd>Mason<cr>", desc = "open mason"
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = true,
      ensure_installed = {
        "ansiblels",
        "awk_ls",
        "bashls",
        "cssls",
        "dockerls",
        "gopls",
        "helm_ls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "puppet",
        "pyright",
        "sqlls",
        "terraformls",
        "tinymist",
        "vimls",
        "yamlls",
      },
    },
  },
}
