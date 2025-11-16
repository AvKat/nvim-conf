return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({ 
        ensure_installed = {
          'ts_ls',
          'rust_analyzer',
          'lua_ls',
          'pyright',
          'clangd',
          'tinymist'
        }})
    end
  }
}
