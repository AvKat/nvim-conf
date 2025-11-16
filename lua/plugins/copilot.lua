return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_enable = true
    vim.g.copilot_filetypes = { racket = false, tex = false, c = false, haskell = false, cpp = false, typst = false, scala = false }
    vim.g.copilot_no_tab_map = true
    vim.cmd('inoremap <silent><script><expr> <C-p> copilot#Accept("\\<CR>")')
    vim.keymap.set('n', '<leader>cdb', ':Copilot disable<CR>')
  end
}
