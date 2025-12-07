return {
  {
    'mason-org/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'ts_ls',
          'rust_analyzer',
          'lua_ls',
          'pyright',
          'clangd',
          'tinymist'
        }
      })
    end
  }
}
