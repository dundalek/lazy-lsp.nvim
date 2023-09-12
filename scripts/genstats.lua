#!/usr/bin/env luajit
-- Update servers.md

local servers = dofile('lua/lazy-lsp/servers.lua')

local supported = 0
local missing = 0
local total = 0
local supported_servers = {}
local missing_servers = {}

for k, v in pairs(servers) do
  total = total + 1
  if v ~= "" then
    supported = supported + 1
    table.insert(supported_servers, k)
  else
    missing = missing + 1
    table.insert(missing_servers, k)
  end
end

table.sort(supported_servers)
table.sort(missing_servers)

local function lsp_link(server)
  return 'https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#' .. server
end

local f = io.open('servers.md', 'w')
f:write(string.format('\n## Supported: %d / %d\n\n', supported, total))
f:write('| Language Server | Nix package |\n')
f:write('| - | - |\n')
for _, server in ipairs(supported_servers) do
  local nix_pkg = type(servers[server]) == "string" and servers[server] or servers[server][1]
  local nix_link = string.format('https://search.nixos.org/packages?channel=unstable&query=%s&show=%s', nix_pkg, nix_pkg)
  f:write(string.format('| [%s](%s) | [%s](%s) |\n', server, lsp_link(server), nix_pkg, nix_link))
end
f:write(string.format('\n## Missing: %d\n\n', missing))
for _, server in ipairs(missing_servers) do
  f:write(string.format('- [%s](%s)\n', server, lsp_link(server)))
end
f:close()

print("Supported:", supported)
print("Missing:", missing)
print("Total:\t", total)
print()
print("Don't forget to update stats in README.md!")
