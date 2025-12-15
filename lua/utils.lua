local utils = {}

function utils.bind_run_once(cmd)
  vim.keymap.set(
    'n',
    '<leader>rr',
    (':call VimuxRunCommand("%s %s")<CR>'):format(cmd, vim.fn.expand('%')),
    { noremap = true, silent = true, buffer = true })
end

function utils.bind_run_interactive(cmd)
  vim.keymap.set(
    'n',
    '<leader>re',
    (':call VimuxRunCommand("%s %s")<CR>'):format(cmd, vim.fn.expand('%')),
    { noremap = true, silent = true, buffer = true })
end

function utils.change_run_cmd(cmd, hasFileName)
  hasFileName = hasFileName or 0
  local finalCmd = cmd
  if hasFileName == 1 then
    finalCmd = cmd:format(vim.fn.expand('%'))
  end
  vim.keymap.set(
    'n',
    '<leader>rr',
    (':call VimuxRunCommand("%s")<CR>'):format(finalCmd),
    { noremap = true, silent = true, buffer = true })
end

function utils.change_interactive_cmd(cmd, hasFileName)
  local finalCmd = cmd
  if hasFileName == 1 then
    finalCmd = cmd:format(vim.fn.expand('%'))
  end
  vim.keymap.set(
    'n',
    '<leader>re',
    (':call VimuxRunCommand("%s")<CR>'):format(finalCmd),
    { noremap = true, silent = true, buffer = true })
end

return utils
