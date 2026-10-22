return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        before_init = function(_, config)
          local python = vim.env.VIRTUAL_ENV and (vim.env.VIRTUAL_ENV .. "/bin/python")
            or (config.root_dir .. "/.venv/bin/python")

          if vim.uv.fs_stat(python) then
            config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
              python = { pythonPath = python },
            })
          end
        end,
      },
    },
  },
}
