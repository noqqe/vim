require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "awk_ls",
    "bashls",
    "cssls",
    "dockerls",
    "gopls",
    "html",
    "jsonls",
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

