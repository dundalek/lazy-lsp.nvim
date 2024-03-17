#!/usr/bin/env -S nvim -l
-- Update servers.md

vim.opt.rtp:append(".")
vim.opt.rtp:append("tmp/nvim-lspconfig")

local lspconfig = require("lspconfig")
local servers = require("lazy-lsp.servers")
local helpers = require("lazy-lsp.helpers")

-- Filetype stats
local available_servers = {}
for server, pkg in pairs(servers) do
  if pkg ~= "" then
    available_servers[server] = pkg
  end
end

local filetype_to_servers = helpers.build_filetype_to_servers_index(available_servers, lspconfig)

local filetypes_with_variants = {}
for filetype, filetype_servers in pairs(filetype_to_servers) do
  if vim.tbl_count(filetype_servers) > 1 then
    filetypes_with_variants[filetype] = filetype_servers
  end
end

-- Server stats
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

local f = assert(io.open('servers.md', 'w'))

f:write([[
## Filetypes

Following table lists filetypes with more than one associated server.
It can be used to decide which servers to specify using the `preferred_servers` configuration option.

| Filetype | Available servers |
| - | - |
]])
local filetypes = vim.tbl_keys(filetypes_with_variants)
table.sort(filetypes)
for _, filetype in ipairs(filetypes) do
  local filetype_servers = filetypes_with_variants[filetype]
  f:write(string.format('| `%s` | ', filetype))
  table.sort(filetype_servers)
  for i, server in ipairs(filetype_servers) do
    if (i ~= 1) then f:write(', ') end
    f:write(string.format('[%s](%s)', server, lsp_link(server)))
  end
  f:write(" |\n")
end

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
print("Missing:  ", missing)
print("Total:    ", total)
print()
print("Don't forget to update stats in README.md!")
print(string.format("%d out of %d", supported, total))
