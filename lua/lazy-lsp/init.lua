local lspconfig = require("lspconfig")
local servers = require("lazy-lsp.servers")
local overrides = require("lazy-lsp.overrides")
local helpers = require("lazy-lsp.helpers")

local function setup(opts)
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

return {
  setup = setup,
  in_shell = helpers.in_shell,
}
