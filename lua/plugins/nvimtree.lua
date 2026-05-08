local function on_attach(bufnr)
  local api = require('nvim-tree.api')
  local preview = require('nvim-tree-preview')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))

  vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
  vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
  vim.keymap.set('n', '<C-j>', function() return preview.scroll(4) end, opts 'Scroll Down')
  vim.keymap.set('n', '<C-k>', function() return preview.scroll(-4) end, opts 'Scroll Up')

  -- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
  vim.keymap.set('n', '<Tab>', function()
    local ok, node = pcall(api.tree.get_node_under_cursor)
    if ok and node then
      if node.type == 'directory' then
        api.node.open.edit()
      else
        preview.node(node, { toggle_focus = true })
      end
    end
  end, opts 'Preview')
end


return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
    {
      'b0o/nvim-tree-preview.lua',
      dependencies = {
        'nvim-lua/plenary.nvim',
        '3rd/image.nvim', -- Optional, for previewing images
      },
    }
  },
  config = function()
    vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle)

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      on_attach = on_attach,
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        custom = { "node_modules", "^\\.git$" },
        git_ignored = false,
      },
    })
  end
}
