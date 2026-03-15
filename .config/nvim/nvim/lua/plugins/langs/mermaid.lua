return {
  "selimacerbas/mermaid-playground.nvim",
  dependencies = { "barrett-ruth/live-server.nvim" },
  config = function()
    require("mermaid_playground").setup({
      -- all optional; sane defaults shown
      workspace_dir = nil, -- defaults to: $XDG_CONFIG_HOME/mermaid-playground
      index_name = "index.html",
      diagram_name = "diagram.mmd",
      overwrite_index_on_start = false, -- don't clobber your customized index.html
      auto_refresh = true,
      auto_refresh_events = { "InsertLeave", "TextChanged", "TextChangedI", "BufWritePost" },
      debounce_ms = 450,
      notify_on_refresh = false,
    })
  end,
}
