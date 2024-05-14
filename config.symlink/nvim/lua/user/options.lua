local options = {
  breakindent = true,
  concealcursor = 'nc',
  cursorline = true,
  fileencoding = 'utf-8',
  foldenable = false,
  foldmethod = 'marker',
  foldnestmax = 10,
  ignorecase = true,
  inccommand = 'split',
  linebreak = true,
  list = true,
  listchars = {
    eol = '¬',
    extends = '>',
    precedes = '<',
    tab = '▸ ',
    trail = '~',
  },
  mouse = 'a',
  number = true,
  relativenumber = true,
  scrolloff = 4,
  shiftwidth = 0,  -- use tabstop
  sidescroll = 10,
  sidescrolloff = 4,
  smartcase = true,
  softtabstop = -1,  -- use shiftwidth
  spelllang = 'en_us',
  splitbelow = true,
  splitright = true,
  tabstop = 4,
  termguicolors = true,
  undofile = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.formatoptions:append 'j'
vim.opt.iskeyword:append '-'
