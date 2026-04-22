return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },

    -- CUSTOM: Unique word for highlighting personalised edits.
    opts = { signs = false, keywords = { CUSTOM = {
      icon = ' ',
      color = '#7851A9',
    } } },
  },
}
