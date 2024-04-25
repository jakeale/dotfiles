-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function()
  --     require('nvim-tree').setup {}
  --   end,
  -- },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup { open_mapping = '<C-g>', direction = 'horizontal' }

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

      function lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua lazygit_toggle()<CR>', { desc = 'lazy[g]it', noremap = true, silent = true })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup {
        options = {
          offsets = {
            { filetype = 'neo-tree' },
          },
        },
      }
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      }
    end,
  },
}
