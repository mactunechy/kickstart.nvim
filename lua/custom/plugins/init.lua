-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'max397574/better-escape.nvim',
    lazy = false,
    config = function()
      require('better_escape').setup {
        mapping = { 'jj' }, -- a table with mappings to use
        timeout = 200, -- the time in which the keys must be hit in ms. clear_empty_lines = false, keys = '<ESC>', -- keys used for escaping
      }
    end,
  },
  { 'tpope/vim-rails', ft = { 'ruby' } },
  {
    'mactunechy/rails-view-component-gd.nvim',
    ft = { 'slim', 'erb', 'rb' },
    keys = {
      { '<leader>gd', '<cmd>OpenViewComponentClass <CR>', desc = 'ViewComponent Class' },
      { '<leader>gk', '<cmd>OpenViewComponentTemplate <CR>', desc = 'ViewComponent Template' },
      { '<leader>gs', '<cmd>OpenViewComponentSpec <CR>', desc = 'ViewComponent Spec' },
      { '<leader>gv', '<cmd>ToggleViewComponent <CR>', desc = 'Toggle ViewComponent ClassAndTemplate' },
    },
    config = function()
      require('rails-view-component-gd').setup()
    end,
  },
  {
    'nathom/filetype.nvim',
    lazy = false,
    config = function()
      require('filetype').setup {
        overrides = {
          extensions = {
            slim = 'slim',
          },
        },
      }
    end,
  },
  {
    'slim-template/vim-slim',
    ft = 'slim',
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  { 'preservim/vimux', event = 'VeryLazy' }, -- send test command in tmux pane
  {
    'vim-test/vim-test',
    event = 'VeryLazy',
    keys = {
      { '<leader>tt', '<cmd>TestNearest -strategy=neovim<CR>', desc = 'Test Nearest' },
      { '<leader>tl', '<cmd>TestLast -strategy=neovim<CR>', desc = 'Test Last' },
      { '<leader>tf', '<cmd>TestFile -strategy=neovim<CR>', desc = 'Test File' },
      { '<leader>ts', '<cmd>TestSuite -strategy=neovim<CR>', desc = 'Test Suite' },
    },
    config = function()
      vim.cmd [[ let test#ruby#rspec#executable = 'bundle exec rspec' ]]
    end,
  },
  {
    'almo7aya/openingh.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>og', '<cmd>OpenInGHFileLines<cr>', desc = 'Open in Github' },
    },
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip').filetype_extend('ruby', { 'rails' })
    end,
  },
}
