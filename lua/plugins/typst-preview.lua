return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  -- lazy.nvim will implicitly calls `setup {}`
  opts = {
    get_root = function(_)
      return "/Users/avishkathpal/"
    end
  },
}
