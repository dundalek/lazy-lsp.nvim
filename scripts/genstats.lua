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
  if not lspconfig[server].document_config.default_config.filetypes then
    print(string.format("Info: No filetypes for %s", server))
  end
end

-- Curated recommendations
local curated_opts = [[{
  excluded_servers = {
    "ccls",                            -- prefer clangd
    "denols",                          -- prefer eslint and ts_ls
    "docker_compose_language_service", -- yamlls should be enough?
    "flow",                            -- prefer eslint and ts_ls
    "ltex",                            -- grammar tool using too much CPU
    "quick_lint_js",                   -- prefer eslint and ts_ls
    "scry",                            -- archived on Jun 1, 2023
    "tailwindcss",                     -- associates with too many filetypes
  },
  preferred_servers = {
    markdown = {},
    python = { "pyright", "ruff_lsp" },
  },
}
]]
local opts = load("return " .. curated_opts)()

local filetype_to_servers = helpers.enabled_filetypes_to_servers(
  available_servers, lspconfig, {}, {}
)
local filetype_to_servers_curated = helpers.enabled_filetypes_to_servers(
  available_servers, lspconfig, opts.excluded_servers, opts.preferred_servers
)

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

local function write_server_list(f, servers)
  table.sort(servers)
  for i, server in ipairs(servers) do
    if (i ~= 1) then f:write(', ') end
    f:write(string.format('[%s](%s)', server, lsp_link(server)))
  end
end

local f = assert(io.open('servers.md', 'w'))

f:write([[

## Curated servers

You can use the following configuration to enable a smaller selection of recommended servers that should work well for most users.

```lua
]] ..
  curated_opts ..
  [[
```
## Servers by filetypes

Following table lists filetypes with more than one associated server.
It can be used to decide which servers to specify using the `excluded_servers` and `preferred_servers` configuration options.

| Filetype | Available servers | Curated selection |
| - | - | - |
]])
local filetypes = vim.tbl_keys(filetypes_with_variants)
table.sort(filetypes)
for _, filetype in ipairs(filetypes) do
  f:write(string.format('| `%s` | ', filetype))
  write_server_list(f, filetypes_with_variants[filetype])

  f:write(" | ")
  write_server_list(f, filetype_to_servers_curated[filetype])

  f:write(" |\n")
end

f:write(string.format('\n## Available servers: %d / %d\n\n', supported, total))
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

-- Auto update stats in README
f = assert(io.open('README.md', 'r+'))
local content = f:read("*all")
content = content:gsub(
  "<!%-%- SERVER_COUNT_PLACEHOLDER %-%->.+<!%-%- SERVER_COUNT_PLACEHOLDER %-%->",
  string.format("<!-- SERVER_COUNT_PLACEHOLDER -->%d out of %d<!-- SERVER_COUNT_PLACEHOLDER -->", supported, total)
)
f:seek("set")
f:write(content)
f:close()

print("Supported:", supported)
print("Missing:  ", missing)
print("Total:    ", total)
