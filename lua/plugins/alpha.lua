return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local theme = require("alpha.themes.theta")
    local config = theme.config
    local dashboard = require("alpha.themes.dashboard")
    local buttons = {
      type = "group",
      val = {
        { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("n", "  New file", "<cmd>ene<CR>"),
        dashboard.button("o", "  Open File", "<cmd>Telescope find_files<CR>"),
        dashboard.button("e", "  Explore File", "<cmd>NvimTreeToggle<CR>"),
        dashboard.button("t", "  Find text", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
        -- dashboard.button("u", "  Update plugins", "<cmd>PackerSync<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
      },
      position = "center",
    }

    -- config.layout[2] = header_color()
    config.layout[6] = buttons
    config.opts = {
      setup = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          desc = "Disable status and tabline for alpha",
          callback = function()
            vim.go.laststatus = 0
            vim.opt.showtabline = 0
            vim.g.indentLine_enabled = 0
          end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
          buffer = 0,
          desc = "Enable status and tabline after alpha",
          callback = function()
            vim.go.laststatus = 3
            vim.opt.showtabline = 2
            vim.g.indentLine_enabled = 1
          end,
        })
      end,
      margin = 5,
    }

    alpha.setup(config)
  end
}
