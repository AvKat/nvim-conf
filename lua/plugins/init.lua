return {
  -- language support
  {
    'kaarmu/typst.vim',
    ft = { 'typst' }
  },
  -- appearance
  'norcalli/nvim-colorizer.lua',
  'sainnhe/sonokai',
  'edkolev/tmuxline.vim',
  'lukas-reineke/indent-blankline.nvim',
  -- editing
  {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsMultilineClose = 0
    end,
  },
  'gibiansky/vim-latex-objects',
  -- 'alvan/vim-closetag',
  -- 'tmhedberg/SimpylFold',
  -- 'tpope/vim-surround',
  -- navigation
  'christoomey/vim-tmux-navigator',
  -- git
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
}
