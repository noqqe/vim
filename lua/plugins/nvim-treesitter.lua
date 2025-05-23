-- Syntax Highlighting Plugins
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        sync_install = true,
        auto_install = false,
        indent = {
          enable = true,
        },
        highlight = {
          enable = true
        },
        ignore_install = { "all" },
        ensure_installed = {
          "bash",
          "diff",
          "dockerfile",
          "dot",
          "fish",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "helm",
          "html",
          "http",
          "ini",
          "java",
          "javascript",
          "jq",
          "json",
          "json5",
          "lua",
          "make",
          "markdown",
          "nix",
          "perl",
          "php",
          "python",
          "r",
          "regex",
          "regex",
          "rst",
          "rst",
          "ruby",
          "rust",
          "scss",
          "sql",
          "terraform",
          "toml",
          "vim",
          "yaml",
        },
      })
    end,
  },
}
