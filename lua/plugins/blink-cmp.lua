return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.snippets',
    'fang2hou/blink-copilot',
  },
  opts = {
    fuzzy = { implementation = "prefer_rust_with_warning" },
    snippets = { preset = 'mini_snippets' },
    keymap = {
      preset = 'default',
      ["<CR>"] = {
        action = function()
          if require('blink.cmp').is_visible() then
            return require('blink.cmp').confirm({ select = true })
          else
            return require('blink.cmp').close()
          end
        end,
        description = "Confirm completion or close menu",
      },
    },
    sources = {
      default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    cmdline = {
      keymap = {
        preset = 'cmdline',
      },
      completion = {
        menu = {
          auto_show = true
        }
      }
    }
  }
}
