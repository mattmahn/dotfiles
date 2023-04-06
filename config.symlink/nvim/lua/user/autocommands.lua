local function augroup(group_name)
  return vim.api.nvim_create_augroup(group_name, { clear = true })
end
local autocmd = vim.api.nvim_create_autocmd

autocmd({'TextYankPost'}, {
  callback = function () vim.highlight.on_yank() end
})

-- automatically dis/enable relative number in focused splits
local numbertoggle = augroup('numbertoggle')
autocmd(
  {'BufEnter', 'FocusGained', 'InsertEnter', 'WinEnter'},
  {
    group = numbertoggle,
    command = 'if &number | set relativenumber | endif'
  }
)
autocmd(
  {'BufLeave', 'FocusLost', 'InsertLeave', 'WinLeave'},
  {
    group = numbertoggle,
    command = 'if &number | set norelativenumber | endif'
  }
)

-- automatically equalize splits when vim is resized
autocmd({'VimResized'}, {
  command = 'wincmd ='
})
