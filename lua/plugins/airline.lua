return {
  'vim-airline/vim-airline',
  config = function()
    vim.g['airline#extensions#tabline#enabled'] = 1
    vim.g['airline#extensions#coc#enabled'] = 1
    vim.g['airline#extensions#fugitiveline#enabled'] = 1
    vim.g['airline#extensions#tmuxline#enabled'] = 1
    vim.g["airline#extensions#tabline#show_tabs"] = 0
    -- vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
    vim.g['ariline_powerline_fonts'] = 1
    vim.g['airline_theme'] = 'sonokai'

    if not vim.g['airline_symbols'] then
      vim.g['airline_symbols'] = {}
    end
    vim.g['airline_symbols'].branch = ''
    vim.g['airline_symbols'].readonly = ''
    vim.g['airline_symbols'].linenr = ''

    vim.keymap.set('n', '<Tab>', ':bn<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<S-Tab>', ':bp<CR>', { noremap = true, silent = true })
  end
}

