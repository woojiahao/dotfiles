-- Configurations inspired by https://www.reddit.com/r/neovim/comments/1hhiidm/a_few_nice_fzflua_configurations_now_that_lazyvim/
-- to allow fuzzy finding with things like file exclusion
-- E.g. > python --!*.lua !example.lua
-- The above will find for all instances of python in the file while omitting .lua files and the example.lua file
return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      oldfiles = {
        include_current_session = true,
      },
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100,
        },
      },
      files = {
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
      },
      grep = {
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
      },
    },
  },
}
