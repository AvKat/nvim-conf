return {
  'nvim-treesitter/nvim-treesitter',
  cmd = { 'TSUpdate' },
  config = function() 
    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the four listed parsers should always be installed)
      ensure_installed = { "c", "lua", "vim", "javascript", "typescript", "racket" },
      ignore_install = { "latex", },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      highlight = {
        enable = true,
        disable = { "tex" },
        additional_vim_regex_highlighting = false,
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ao"] = "@parameter.outer",
            ["io"] = "@parameter.inner",
            ["as"] = "@scope.outer",
            ["is"] = "@scope.inner",
          },
          include_surrounding_whitespace = true,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
            ["]m"] = "@class.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["[m"] = "@class.outer",
          },
        }
      }
    }
  end
}
