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
  { 'tpope/vim-haml', ft = { 'haml' } },
  {
    'nathom/filetype.nvim',
    lazy = false,
    config = function()
      require('filetype').setup {
        overrides = {
          extensions = {
            rb = 'ruby',
            ruby = 'ruby',
            haml = 'haml',
          },
        },
      }
    end,
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
      vim.cmd [[ let test#neovim#term_position = "vert" ]]
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
  { 'mg979/vim-visual-multi' },
  { 'jgdavey/vim-blockle' },
  { 'kana/vim-textobj-user' },
  -- Operator-pending mapping r is added. dir, yar and other mappings are available like diw, yi'. if, unless, case, while, until, for, def, module, class, do, begin blocks are selected as text-objects.
  { 'rhysd/vim-textobj-ruby', ft = { 'ruby' } },
  {
    'jackMort/ChatGPT.nvim',
    event = 'VeryLazy',
    config = function()
      require('chatgpt').setup {
        -- this config assumes you have OPENAI_API_KEY environment variable set
        openai_params = {
          model = 'gpt-4-1106-preview',
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'folke/trouble.nvim', -- optional
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.dbs = {
        { name = '65winks', url = 'mysql://root@0.0.0.0:3306/sixty_five_winks_development' },
      }
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  {
    'mbbill/undotree',
    event = 'VeryLazy',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Undotree' },
    },
  },
}
