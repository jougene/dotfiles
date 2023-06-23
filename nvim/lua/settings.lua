vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader=","
vim.g.maplocalleader=","
vim.g.move_key_modifier = "C-S"
vim.g.move_key_modifier_visualmode = "C-S"

vim.cmd('colorscheme gruvbox')

local editor_options = {
  compatible = false,
  background = "dark",
  encoding = "UTF-8",
  fileencoding = "UTF-8",
  langmenu = "en_US.UTF-8",
  spelllang="en_us",
  spell = "true",
  foldmethod = "syntax",
  foldnestmax = 10,
  -- nofoldenable = "true",
  foldlevel = 1,


  -- backup = false,
  swapfile = false,
  -- autoread = true,
  -- autowrite = true,
  -- writebackup = false,
  -- history = 50,
  -- laststatus = 2,
  shell = os.getenv("SHELL"),
  tabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  -- showbreak = "↪| ",
  -- hlsearch = true,
  -- incsearch = true,
  -- ignorecase = true,
  -- showmode = false,
  linespace = 2,
  termguicolors = true,
  splitbelow = true,
  splitright = true,
  -- cmdheight = 2,
  -- updatetime = 100,
  -- timeoutlen = 500
}

local window_options = {
  number = true,
  cursorline = true,
  wrap = true,
  list = true
}

for key, val in pairs(editor_options) do vim.o[key] = val end
for key, val in pairs(window_options) do vim.wo[key] = val end
