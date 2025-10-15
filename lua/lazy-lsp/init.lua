local helpers = require("lazy-lsp.helpers")

local function setup_with_lspconfig(opts)
  local lspconfig = require("lspconfig")
  local servers = require("lazy-lsp.servers")
  local overrides = require("lazy-lsp.overrides")
  for server, config in pairs(helpers.server_configs(lspconfig, servers, opts, overrides)) do
    assert(config.filetypes, "server " .. server .. " does not provide filetypes and is not omitted")

    -- Based on https://github.com/neovim/nvim-lspconfig/blob/d67715d3b746a19e951b6b0a99663fa909bb9e64/lua/lspconfig/configs.lua#L98-L112
    -- Decided to avoid wildcard and only register when a server explicitly specifies filetypes
    local lsp_group = vim.api.nvim_create_augroup("lazy_lsp_setup", { clear = false })
    local autocmd_id
    autocmd_id = vim.api.nvim_create_autocmd("FileType", {
      pattern = config.filetypes,
      callback = function(opt)
        -- We just need to setup the server once, remove autocmd so it does not run again.
        vim.api.nvim_del_autocmd(autocmd_id)

        local M = lspconfig[server]
        M.setup(config)

        -- Since we setup inside autocmd callback, we need to help trigger autostart manually.
        -- Since lspconfig sets up its own autocmd it will handle it in the future by itself.
        if M.autostart then
          vim.schedule(function()
            M.manager:try_add(opt.buf)
          end)
        end
      end,
      group = lsp_group,
      desc = string.format("Lazily setup %s lsp server", server),
    })
  end
end

local function setup_with_vim_lsp_config(opts)
  local servers = require("lazy-lsp.servers")
  local overrides = require("lazy-lsp.overrides")
  for server, config in pairs(helpers.vim_lsp_server_configs(vim.lsp.config, servers, opts, overrides)) do
    assert(config.filetypes, "server " .. server .. " does not provide filetypes and is not omitted")

    -- For Neovim 0.11+
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
  end
end

local function setup(opts)
  opts = opts or {}
  if opts.use_vim_lsp_config then
    if vim.lsp.config then
      setup_with_vim_lsp_config(opts)
      return
    else
      vim.notify(
        "lazy-lsp: use_vim_lsp_config is set but vim.lsp.config is not available. Falling back to lspconfig.",
        vim.log.levels.WARN
      )
    end
  end

  -- workaround: volar got renamed to vue_ls, but vue_ls is not available as legacy config
  local servers = require("lazy-lsp.servers")
  servers.volar = servers.vue_ls
  servers.vue_ls = ""

  setup_with_lspconfig(opts)
end

return {
  setup = setup,
  in_shell = helpers.in_shell,
}
