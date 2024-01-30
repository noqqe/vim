require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "awk_ls",
    "ansiblels",
    "bashls",
    "cssls",
    "dockerls",
    "helm_ls",
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
    "lua_ls",
  }
})
