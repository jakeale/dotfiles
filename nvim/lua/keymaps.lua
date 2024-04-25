-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous [d]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [d]iagnostic message' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show [c]ode [d]iagnostic message' })

--
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- misc
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', { desc = 'Write file' })
-- vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', { desc = 'Nvim[T]ree' })
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'File [E]xplorer' })

-- buffers
vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', 'd<Tab>', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
