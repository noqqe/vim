require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "awk_ls",
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "html",
    "jsonls",
    "gopls",
    "marksman",
    "puppet",
    "pyright",
    "sqlls",
    "vimls",
    "yamlls",
    "terraformls",
    "sumneko_lua",
  }
})

