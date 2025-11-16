local lsp_attach = function(args)
  local map = vim.keymap.set
  local opts = { buffer = args.buf, remap = false }
  -- local client = vim.lsp.get_client_by_id(args.data.client_id)

  map("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
  map("n", "<leader>gr", function() require('telescope.builtin').lsp_references() end, opts)
  map("n", "<leader>fs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, opts)
  map("n", "K", function() vim.lsp.buf.hover() end, opts)
  map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  map("n", "[g", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
  map("n", "]g", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
  map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  map("n", "<leader>aa", vim.diagnostic.setqflist)
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
