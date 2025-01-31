local function find_python_binary(name)
  local binary_name = name
  if vim.fn.has("win32") == 1 then
    binary_name = name .. ".exe"
  end

  local bin_dir = vim.fn.has("win32") == 1 and "Scripts" or "bin"

  local path
  if vim.env.VIRTUAL_ENV ~= nil then
    path = vim.fs.joinpath(vim.env.VIRTUAL_ENV, bin_dir, binary_name)
  else
    path = vim.fs.joinpath(vim.fn.getcwd(), ".venv", bin_dir, binary_name)
  end

  if vim.fn.executable(path) == 1 then
    return path
  end

  local pkg = require("mason-registry").get_package(name)
  if pkg ~= nil then
    local cmd = pkg:get_install_path() .. "/bin/" .. name
    if vim.fn.filereadable(cmd) == 1 then
      vim.notify_once("Using from mason-registry: " .. vim.inspect(cmd), vim.log.levels.WARN)
      return cmd
    end
  end

  vim.notify_once("Could not find binary in .venv or mason-registry: " .. name, vim.log.levels.ERROR)

  return name
end

local root_files = {
  "pyproject.toml",
  "ruff.toml",
  ".ruff.toml",
  "requirements.txt",
  "uv.lock",
  "setup.py",
  "setup.cfg",
  "Pipfile",
  "pyrightconfig.json",
  ".git",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.py" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.colorcolumn = "88"
  end,
})

return {
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "mypy" })
        end,
      },
    },
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters = opts.linters or {}

      opts.linters_by_ft["python"] = { "mypy" }
      opts.linters["mypy"] = {
        cmd = function()
          return find_python_binary("mypy")
        end,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        {
          "williamboman/mason.nvim",
        },
      },
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "basedpyright", "ruff" })
      end,
    },
    opts = {
      servers = {
        --@type vim.lsp.Config
        ruff = {
          cmd = { "ruff", "server" },
          filetypes = { "python" },
          root_dir = (function()
            return vim.fs.root(0, root_files)
          end)(),
          on_attach = function(client, _)
            if client.name == "ruff" then
              client.server_capabilities.hoverProvider = false
            end
          end,
          capabilities = {
            general = {
              positionEncodings = { "utf-16" },
            },
          },
          init_options = {
            settings = {
              configurationPreference = "filesystemFirst",
              lineLength = 88,
            },
          },
          settings = {
            ruff = {},
          },
        },
        --@type vim.lsp.Config
        basedpyright = {
          cmd = { "basedpyright-langsever", "--stdio" },
          filetypes = { "python" },
          root_markers = root_files,
          log_level = vim.lsp.protocol.MessageType.Debug,
          settings = {
            python = {
              venvPath = os.getenv("VIRTUAL_ENV"),
              pythonPath = vim.fn.exepath("python"),
            },
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    lazy = true,
    ft = { "python" },
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-python"] = {
        runner = "pytest",
        -- TODO: write coverage...
        args = { "--log-level", "INFO", "--color", "yes", "-vv", "-s" },
        dap = { justMyCode = false },
      }
    end,
  },
  {
    "andythigpen/nvim-coverage",
    lazy = true,
    ft = { "python" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      auto_reload = true,
      lang = {
        python = {
          coverage_file = vim.fn.getcwd() .. "/coverage.out",
        },
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    ft = { "python" },
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      name = "venv",
      notify_user_on_venv_activation = true,
      auto_refresh = true,
      dap_enabled = true,
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select your virtual environment for Python" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Retrieve the virtual environment from a cache" },
    },
  },
  {
    "stevanmilic/nvim-lspimport",
    ft = { "python" },
  },
}
