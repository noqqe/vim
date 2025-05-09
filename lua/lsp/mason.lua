require("mason").setup()

require("mason-lspconfig").setup({
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
  }
})
