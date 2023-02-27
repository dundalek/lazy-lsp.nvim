#!/usr/bin/env luajit

local serpent = require("serpent")

local servers_file = 'lua/lazy-lsp/servers.lua'
local configurations_directory = 'tmp/nvim-lspconfig/lua/lspconfig/server_configurations'

local lazy_servers = dofile(servers_file)
local servers = {}

local pfile = io.popen("ls '" .. configurations_directory .. "'")
for filename in pfile:lines() do
  server = filename:gsub('%.lua$', '')
  servers[server] = ""
end
pfile:close()

for k, v in pairs(lazy_servers) do
  local server_exists_in_lspconfig = servers[k]
  local nix_pkg_defined = v ~= ""
  if server_exists_in_lspconfig and nix_pkg_defined then
    servers[k] = v
  end
end

local f = io.open(servers_file, 'w')
f:write('return ' .. serpent.block(servers, { comment = false }) .. '\n')
f:close()
