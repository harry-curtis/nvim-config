-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

-- See the kickstart.nvim README for more information

-- NOTE: None of the plugins in this file are actually being loaded by Lazy at
-- the moment; I'm on the fence about whether I want to continue using them or
-- not.
return {
  {
    -- barbar.nvim creates tabs for you to easily switch between buffers.
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '<A-,>', ':BufferPrevious<CR>', opts)
      map('n', '<A-.>', ':BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
      map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
      map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
      map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
      map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
      map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
      map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
      map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
      map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
      map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
      map('n', '<A-0>', ':BufferLast<CR>', opts)
      -- Close buffer
      map('n', '<A-c>', ':BufferClose<CR>', opts)
      -- Wipeout buffer
      --                 :BufferWipeout<CR>
      -- Close commands
      --                 :BufferCloseAllButCurrent<CR>
      --                 :BufferCloseBuffersLeft<CR>
      --                 :BufferCloseBuffersRight<CR>
      -- Magic buffer-picking mode
      map('n', '<C-p>', ':BufferPick<CR>', opts)
      -- Sort automatically by...
      map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
      map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
      map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

      -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used
    end,
    opts = {
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    -- Sidebar offset (e.g. for NvimTree)
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- CUSTOM: render-markdown.nvim
  -- the 'pylatexenc' package for your machine. For that to be possible, you'll
  -- also need to have a Python interpreter installed, PIP, and have all three
  -- accessible via the path variable.
  --
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  -- CUSTOM: Added the VimTeX plugin. The PDF viewer that I went for is Sioyek, but
  -- the vimtex_view_method can just be updated if a different viewer is
  -- installed.
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
  -- {
  --   'jake-stewart/multicursor.nvim',
  --   branch = '1.0',
  --   config = function()
  --     local mc = require 'multicursor-nvim'
  --     mc.setup()
  --
  --     local set = vim.keymap.set
  --
  --     -- Add or skip cursor above/below the main cursor.
  --     set({ 'n', 'x' }, '<up>', function()
  --       mc.lineAddCursor(-1)
  --     end)
  --     set({ 'n', 'x' }, '<down>', function()
  --       mc.lineAddCursor(1)
  --     end)
  --     set({ 'n', 'x' }, '<leader><up>', function()
  --       mc.lineSkipCursor(-1)
  --     end)
  --     set({ 'n', 'x' }, '<leader><down>', function()
  --       mc.lineSkipCursor(1)
  --     end)
  --
  --     -- Add or skip adding a new cursor by matching word/selection
  --     set({ 'n', 'x' }, '<leader>n', function()
  --       mc.matchAddCursor(1)
  --     end)
  --     set({ 'n', 'x' }, '<leader>s', function()
  --       mc.matchSkipCursor(1)
  --     end)
  --     set({ 'n', 'x' }, '<leader>N', function()
  --       mc.matchAddCursor(-1)
  --     end)
  --     set({ 'n', 'x' }, '<leader>S', function()
  --       mc.matchSkipCursor(-1)
  --     end)
  --
  --     -- Add and remove cursors with control + left click.
  --     set('n', '<c-leftmouse>', mc.handleMouse)
  --     set('n', '<c-leftdrag>', mc.handleMouseDrag)
  --     set('n', '<c-leftrelease>', mc.handleMouseRelease)
  --
  --     -- Disable and enable cursors.
  --     set({ 'n', 'x' }, '<c-q>', mc.toggleCursor)
  --
  --     -- Mappings defined in a keymap layer only apply when there are
  --     -- multiple cursors. This lets you have overlapping mappings.
  --     mc.addKeymapLayer(function(layerSet)
  --       -- Select a different cursor as the main one.
  --       layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
  --       layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)
  --
  --       -- Delete the main cursor.
  --       layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)
  --
  --       -- Enable and clear cursors using escape.
  --       layerSet('n', '<esc>', function()
  --         if not mc.cursorsEnabled() then
  --           mc.enableCursors()
  --         else
  --           mc.clearCursors()
  --         end
  --       end)
  --     end)
  --
  --     -- Customize how cursors look.
  --     local hl = vim.api.nvim_set_hl
  --     hl(0, 'MultiCursorCursor', { reverse = true })
  --     hl(0, 'MultiCursorVisual', { link = 'Visual' })
  --     hl(0, 'MultiCursorSign', { link = 'SignColumn' })
  --     hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
  --     hl(0, 'MultiCursorDisabledCursor', { reverse = true })
  --     hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
  --     hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  --   end,
  -- },
}
