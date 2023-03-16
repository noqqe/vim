local nvim_lsp = require('lspconfig')

-- Save on logs
vim.lsp.set_log_level("error")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Configure Languages

nvim_lsp['awk_ls'].setup { capabilities = capabilities }

nvim_lsp['bashls'].setup {
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach
}

nvim_lsp['cssls'].setup {
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
}

nvim_lsp['dockerls'].setup { capabilities = capabilities }

nvim_lsp['html'].setup {
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach
}

nvim_lsp['jsonls'].setup { capabilities = capabilities }
nvim_lsp['marksman'].setup { capabilities = capabilities }
nvim_lsp['puppet'].setup { capabilities = capabilities }

nvim_lsp['pyright'].setup {
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach
}

nvim_lsp['sqlls'].setup { capabilities = capabilities }
nvim_lsp['vimls'].setup { capabilities = capabilities }
nvim_lsp['yamlls'].setup { capabilities = capabilities }

-- https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md
nvim_lsp['terraformls'].setup {
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
  settings = {
    root_dir = ".git",
  }
}

nvim_lsp['ansiblels'].setup {
  capabilities = capabilities,
  settings = {
    single_file_detection = true
  }
}

-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
nvim_lsp['gopls'].setup {
  on_attach = require("lsp-format").on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        composites = false,
      },
      staticcheck = true,
    },
  },
}

nvim_lsp['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = require("lsp-format").on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
