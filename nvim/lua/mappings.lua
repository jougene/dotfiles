local bind = vim.keymap.set
local opts = { silent = true, noremap = true }
local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

-- Better window movement
bind("n", "<C-l>", "<C-w>l", opts)
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)

bind("n", "gV", "`[v`]", opts)
bind("n", "k", "gk", opts)
bind("n", "j", "gj", opts)

-- for russian layout
bind("i", "<c-х>", "<C-[>", opts)
bind("n", "л", "gk", opts)
bind("n", "о", "gj", opts)
bind("i", "<C-г>", "<C-G>u<C-U>", opts)
bind("i", "<C-ц>", "<C-G>u<C-W>", opts)

-- Copy to clipboard
bind('v', '<leader>y', '"+y')
bind('n', '<leader>Y', '"+yg_', opts)
bind('n', '<leader>y', '"+y', opts)
bind('n', '<leader>yy', '"+yy', opts)

bind("n", "<leader><space>",  ':nohlsearch<CR>', opts)

-- Tree
bind('n', '<leader><leader>', ':NvimTreeToggle<CR>')
bind('n', '<leader>1',        ':NvimTreeFindFile<CR>')

-- File navigation
bind('n', '<leader>bb',   '<cmd>Telescope buffers show_all_buffers=true<CR>', opts)
bind('n', '<leader>ff',   '<cmd>Telescope find_files<CR>', opts)
bind('n', '<C-p>',        '<cmd>Telescope git_files<CR>', opts)
bind('n', '<C-g>',        '<cmd>Telescope live_grep<CR>', opts)
bind('n', '<C-e>',        '<cmd>Telescope oldfiles<CR>', opts)

-- Comments
bind('n', '<C-\\>', require('Comment.api').toggle.linewise.current)
bind('x', '<C-\\>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    require('Comment.api').toggle.linewise(vim.fn.visualmode())
end)

bind('n', '<space>n', '<cmd>lua vim.diagnostic.goto_next()<CR>')
bind('n', '<space>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

--Rest client
bind('n', '<C-CR>', '<Plug>RestNvim')
