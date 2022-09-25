#!/usr/bin/env luajit

require 'luarocks.loader'
local serpent = require("serpent")

local lazy_servers = dofile('lua/lazy-lsp/servers.lua')

local directory = 'tmp/nvim-lspconfig/lua/lspconfig/server_configurations'

local servers = {}

local pfile = io.popen("ls '" .. directory .. "'")
for filename in pfile:lines() do
  server = filename:gsub('%.lua$', '')
  servers[server] = ""
end
pfile:close()

for k, v in pairs(lazy_servers) do
  if v ~= "" then
    servers[k] = v
  end
end

local f = io.open("tmp.lua", "w")
f:write('return ' .. serpent.block(servers, { comment = false }))
f:close()
