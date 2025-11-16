return {
  'preservim/vimux',
  config = function()
    vim.g.VimuxOrientation = 'h'
    vim.g.VimuxRunnerName = 'VimuxRun'
    vim.g.VimuxHeight = '30'

    vim.keymap.set('n', '<leader>cl', ':VimuxClearTerminalScreen<CR>')
    vim.keymap.set('n', '<leader>hh', ':VimuxTogglePane<CR>')
  end
}
