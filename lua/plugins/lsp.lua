local lsp_attach = function(args)
  local map = vim.keymap.set
  local opts = { buffer = args.buf, remap = false }
  -- local client = vim.lsp.get_client_by_id(args.data.client_id)

  ---@format disable
  map("n", "<leader>gd",   vim.lsp.buf.definition,                                              opts)
  map("n", "<leader>gr",   require('telescope.builtin').lsp_references,                         opts)
  map("n", "<leader>fs",   require("telescope.builtin").lsp_dynamic_workspace_symbols,          opts)
  map("n", "K",            vim.lsp.buf.hover,                                                   opts)
  map("n", "<leader>vd",   vim.diagnostic.open_float,                                           opts)
  map("n", "<leader>vca",  vim.lsp.buf.code_action,                                             opts)
  map("n", "<leader>rn",   vim.lsp.buf.rename,                                                  opts)
  map("n", "<leaderl>gi",  vim.lsp.buf.implementation,                                          opts)
  map("n", "[g",           function() vim.diagnostic.jump({ count = 1, float = true }) end,     opts)
  map("n", "]g",           function() vim.diagnostic.jump({ count = -1, float = true }) end,    opts)
  ---@format enable
end


return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  },
  config = function()
    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format()
    end, {})

    vim.api.nvim_create_autocmd('LspAttach', { callback = lsp_attach })

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local default_conf_servers = { 'pyright', 'clangd', 'ts_ls', 'rust_analyzer', 'coq_lsp' }
    for _, lsp in ipairs(default_conf_servers) do
      vim.lsp.config[lsp] = {
        capabilities = capabilities,
      }
    end

    vim.lsp.config["tinymist"] = {
      capabilities = capabilities,
      root_dir = "/",
      -- root_dir = function(_, bufnr)
      --   return "/Users/avishkathpal"
      -- end,
      settings = {
        exportPdf = "onSave",
        formatterMode = "typstfmt",
        rootPath = "/Users/avishkathpal/Local Docs/",
      }
    }


    vim.lsp.config["lua_ls"] = {
      capabilities = capabilities,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    }
  end
}
