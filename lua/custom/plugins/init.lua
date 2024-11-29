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
            gleam = 'gleam',
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
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<Tab>',
          clear_suggestion = '<C-]>',
          accept_word = '<C-j>',
        },
        ignore_filetypes = { cpp = true }, -- or { "cpp", }
        color = {
          suggestion_color = '#ffffff',
          cterm = 244,
        },
        log_level = 'info', -- set to "off" to disable logging completely
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      }
    end,
  },
  {
    'gleam-lang/gleam.vim',
    ft = 'gleam',
  },
  { 'mg979/vim-visual-multi' },
  { 'jgdavey/vim-blockle' },
  { 'kana/vim-textobj-user' },
  { 'rhysd/vim-textobj-ruby' },
}
