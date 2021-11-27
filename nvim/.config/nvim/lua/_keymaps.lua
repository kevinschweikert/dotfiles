local map = vim.api.nvim_set_keymap  -- set global keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "

map('n', '<Leader>t', ':NvimTreeToggle<CR>', opts)

map('n', '<Leader>j', ':Telescope find_files<CR>', opts)
map('n', '<Leader>p', ':Telescope projects<CR>', opts)
map('n', '<Leader>fb', ':Telescope file_browser<CR>', opts)
map('n', '<Leader>ca', ':Telescope code_action<CR>', opts)
map('n', '<Leader>d', ':Telescope lsp_definition<CR>', opts)
map('n', '<Leader>gs', ':Telescope git_status<CR>', opts)
map('n', '<Leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<Leader>g', ':Telescope grep_string<CR>', opts)
map('n', '<Leader>r', ':Telescope lsp_references<CR>', opts)

map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprev<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

map('n', '<Leader>x', '<cmd>Trouble<cr>', opts)
map('n', '<Leader>xq', '<cmd>Trouble quickfix<cr>', opts)

map('n', '<leader>ps', '<cmd>PackerSync<cr>', opts)

map('i', 'jj', '<esc>', opts)
map('i', 'jk', '<esc>', opts)
