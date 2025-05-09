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

-- vim.lsp.config('awk_ls')
-- vim.lsp.config('bashls')
-- vim.lsp.config('cssls')
-- vim.lsp.config('dockerls')
-- vim.lsp.config('helm_ls')
-- vim.lsp.config('html')
-- vim.lsp.config('jsonls') 
-- vim.lsp.config('marksman') 
-- vim.lsp.config('puppet') 
-- vim.lsp.config('pyright')
-- vim.lsp.config('sqlls')
-- vim.lsp.config('vimls') 

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

vim.lsp.config('tinymist', {
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable"
  },
})
