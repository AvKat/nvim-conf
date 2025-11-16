return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup({
      toggler = {
        line = '<leader>/',
        block = '<nop>',
      },
      opleader = {
        line = '<leader>/',
        block = '<nop>',
      },
      extra = {
        above = '<nop>',
        below = '<nop>',
        eol = '<nop>',
      }
    })
end
}
