local helpers = require("lazy-lsp.helpers")

local function make_config(config)
  config.on_new_config(config, "")
  return config
end

local nix_conf_var = "NIX_CONFIG"
local nix_conf_dir_var = "NIX_CONF_DIR"
vim.uv.os_unsetenv(nix_conf_var)
vim.uv.os_setenv(nix_conf_dir_var, "/dev/null")

describe("lazy-lsp", function()
  it("in_shell with `nix shell` command", function()
    local nix_dir = vim.fs.joinpath(vim.uv.cwd(), ".tests", "nix")
    vim.uv.os_setenv(nix_conf_dir_var, nix_dir)
    vim.uv.os_setenv(nix_conf_var, "extra-experimental-features = nix-command flakes")

    assert(vim.fn.system({
      "nix",
      "registry",
      "add",
      "--registry",
      vim.fs.joinpath(nix_dir, "registry.json"),
      "nixpkgs",
      "path:/nix/store/smth",
    }))

    package.loaded["lazy-lsp.helpers"] = nil
    helpers = require("lazy-lsp.helpers")

    assert.same(
      { "nix", "--flake-registry", "", "shell", "nixpkgs#nix_pkg_a", "--command", "cmd_a" },
      helpers.in_shell({ "nix_pkg_a" }, { "cmd_a" })
    )

    assert.same(
      { "nix", "--flake-registry", "", "shell", "nixpkgs#nix_pkg_a", "--command", "cmd_a", "arg_a" },
      helpers.in_shell({ "nix_pkg_a" }, { "cmd_a", "arg_a" })
    )

    assert.same(
      { "nix", "--flake-registry", "", "shell", "nixpkgs#nix_pkg_a", "nixpkgs#nix_pkg_b", "--command", "cmd_a" },
      helpers.in_shell({ "nix_pkg_a", "nix_pkg_b" }, { "cmd_a" })
    )

    vim.uv.os_setenv(nix_conf_dir_var, "/dev/null")
    vim.uv.os_unsetenv(nix_conf_var)

    package.loaded["lazy-lsp.helpers"] = nil
    helpers = require("lazy-lsp.helpers")
  end)

  it("escape_shell_arg", function()
    assert.same("'hello world'", helpers.escape_shell_arg("hello world"))
    assert.same("'h\"i'", helpers.escape_shell_arg('h"i'))
    assert.same("'h'\"'\"'i'", helpers.escape_shell_arg("h'i"))
    assert.same("''", helpers.escape_shell_arg(""))
  end)

  it("escape_shell_args", function()
    assert.same("'hello world'", helpers.escape_shell_args({ "hello world" }))
    assert.same("'hello world' 'h\"i' 'h'\"'\"'i'", helpers.escape_shell_args({ "hello world", 'h"i', "h'i" }))
    assert.same("", helpers.escape_shell_args({}))
  end)
end)

local fake_lspconfig = {
  fakelsp = {
    document_config = {
      default_config = { filetypes = { "javascript", "python", "typescript" }, cmd = { "fakelsp-binary" } },
    },
  },
  pylsp = { document_config = { default_config = { filetypes = { "python" }, cmd = { "pylsp" } } } },
  pyright = {
    document_config = { default_config = { filetypes = { "python" }, cmd = { "pyright-langserver", "--stdio" } } },
  },
  tsserver = {
    document_config = {
      default_config = { filetypes = { "javascript", "typescript" }, cmd = { "typescript-language-server", "--stdio" } },
    },
  },
}

local fake_server_filetypes = helpers.make_server_filetypes_fn(fake_lspconfig)

local fake_servers = {
  pylsp = "python39Packages.python-lsp-server",
  pyright = "pyright",
  fakelsp = "fakelsp-package",
  tsserver = {
    "nodePackages.typescript-language-server",
    "nodePackages.typescript",
  },
}

local fake_overrides = {}

local function normalize_table_values(tbl)
  for _, v in pairs(tbl) do
    table.sort(v)
  end
  return tbl
end

it("build_filetype_to_servers_index", function()
  local filetype_to_servers = helpers.build_filetype_to_servers_index(fake_lspconfig, fake_server_filetypes)

  assert.same({
    javascript = { "fakelsp", "tsserver" },
    python = { "fakelsp", "pylsp", "pyright" },
    typescript = { "fakelsp", "tsserver" },
  }, normalize_table_values(filetype_to_servers))
end)

describe("build_server_to_filetypes_index", function()
  it("returns same servers and filetypes", function()
    local filetype_to_servers = helpers.build_filetype_to_servers_index(fake_lspconfig, fake_server_filetypes)
    local server_to_filetypes = helpers.build_server_to_filetypes_index(filetype_to_servers)

    assert.same({
      fakelsp = { "javascript", "python", "typescript" },
      pylsp = { "python" },
      pyright = { "python" },
      tsserver = { "javascript", "typescript" },
    }, normalize_table_values(server_to_filetypes))
  end)

  it("returns subset of servers with overrides", function()
    local filetype_to_servers = helpers.build_filetype_to_servers_index(fake_lspconfig, fake_server_filetypes)
    filetype_to_servers.python = { "pyright" }
    filetype_to_servers.typescript = { "tsserver" }
    local server_to_filetypes = helpers.build_server_to_filetypes_index(filetype_to_servers)

    assert.same({
      fakelsp = { "javascript" },
      pyright = { "python" },
      tsserver = { "javascript", "typescript" },
    }, normalize_table_values(server_to_filetypes))
  end)

  it("servers with no filetypes are omitted", function()
    local fake_lspconfig = {
      fakelsp_no_filetypes = {
        document_config = {
          default_config = { cmd = { "fakelsp-no-filetypes" } },
        },
      },
    }
    local fake_server_filetypes = helpers.make_server_filetypes_fn(fake_lspconfig)
    local filetype_to_servers = helpers.build_filetype_to_servers_index(fake_lspconfig, fake_server_filetypes)
    local server_to_filetypes = helpers.build_server_to_filetypes_index(filetype_to_servers)

    assert.same({}, normalize_table_values(server_to_filetypes))
  end)
end)

describe("enabled_filetypes_to_servers", function()
  it("calculates filetype to servers mapping for defined packages", function()
    local servers = { pylsp = "python39Packages.python-lsp-server" }
    local mapping = helpers.enabled_filetypes_to_servers(servers, fake_server_filetypes, {}, {})
    assert.same({
      python = { "pylsp" },
    }, mapping)
  end)

  it("excludes filetype to servers mapping for missing packages", function()
    local servers = { pylsp = "" }
    local mapping = helpers.enabled_filetypes_to_servers(servers, fake_server_filetypes, {}, {})
    assert.same({}, mapping)
  end)
end)

describe("server_configs", function()
  local testserver_lspconfig = {
    testserver = { document_config = { default_config = { cmd = { "ls_original_cmd" }, filetypes = { "test" } } } },
  }

  it("uses cmd from lspconfig", function()
    local cfg = helpers.server_configs(testserver_lspconfig, { testserver = "nix_pkg_name" }, {}, {})
    assert.same(
      { "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_original_cmd'" },
      make_config(cfg.testserver).cmd
    )
  end)

  it("servers config can specify multiple nix packages", function()
    local cfg = helpers.server_configs(testserver_lspconfig, { testserver = { "nix_pkg_a", "nix_pkg_b" } }, {}, {})
    assert.same(
      { "nix-shell", "-p", "nix_pkg_a", "nix_pkg_b", "--run", "'ls_original_cmd'" },
      make_config(cfg.testserver).cmd
    )
  end)

  it("servers config can override cmd", function()
    local cfg = helpers.server_configs(
      testserver_lspconfig,
      { testserver = { "nix_pkg_name" } },
      {},
      { testserver = { cmd = { "ls_server_cmd" } } }
    )
    assert.same({ "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_server_cmd'" }, make_config(cfg.testserver).cmd)
  end)

  it("servers config can override cmd including arguments", function()
    local cfg = helpers.server_configs(
      testserver_lspconfig,
      { testserver = { "nix_pkg_name" } },
      {},
      { testserver = { cmd = { "ls_server_cmd", "--lsp" } } }
    )
    assert.same(
      { "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_server_cmd' '--lsp'" },
      make_config(cfg.testserver).cmd
    )
  end)

  it("user specified cmd takes override priority", function()
    local cfg = helpers.server_configs(
      testserver_lspconfig,
      { testserver = { "nix_pkg_name" } },
      { configs = { testserver = { cmd = { "ls_user_cmd" } } } },
      { testserver = { cmd = { "ls_server_cmd" } } }
    )
    assert.same({ "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_user_cmd'" }, make_config(cfg.testserver).cmd)
  end)

  it("when nix pkg is not available returns (will not setup ls)", function()
    local cfg = helpers.server_configs(testserver_lspconfig, { testserver = "" }, {}, {})
    assert.equals(nil, cfg.testserver)
  end)

  it("merges default_config values", function()
    local cfg = helpers.server_configs(testserver_lspconfig, { testserver = "nix_pkg_name" }, {}, {})
    assert.same(nil, cfg.testserver.some_undefined_parameter)

    local cfg_with_param = helpers.server_configs(
      testserver_lspconfig,
      { testserver = "nix_pkg_name" },
      { default_config = { some_parameter = "some-value" } },
      {}
    )
    assert.same("some-value", cfg_with_param.testserver.some_parameter)
  end)

  it("merges default_config values when user config override is present", function()
    local cfg = helpers.server_configs(
      testserver_lspconfig,
      { testserver = "nix_pkg_name" },
      {
        configs = { testserver = { cmd = { "ls_user_cmd" } } },
        default_config = { some_parameter = "some-value" },
      },
      {}
    )
    assert.same("some-value", cfg.testserver.some_parameter)
  end)

  it("on_new_config does not error when lang config has no on_new_config function", function()
    local cfg = helpers.server_configs(testserver_lspconfig, { testserver = "nix_pkg_name" }, {}, {})
    cfg.testserver.on_new_config(cfg.testserver, "/some/root/path")
    assert.same({ "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_original_cmd'" }, cfg.testserver.cmd)
  end)

  it("on_new_config keeps original cmd if call back does not update it", function()
    local lspconfig_with_on_new_config = {
      testserver = {
        document_config = {
          default_config = {
            cmd = { "ls_original_cmd" },
            filetypes = { "test" },
            on_new_config = function(new_config, root_path) end,
          },
        },
      },
    }
    local cfg = helpers.server_configs(lspconfig_with_on_new_config, { testserver = "nix_pkg_name" }, {}, {})
    cfg.testserver.on_new_config(cfg.testserver, "/some/root/path")
    assert.same({ "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_original_cmd'" }, cfg.testserver.cmd)
  end)

  it("on_new_config updates cmd when callback appends to it (e.g. omnisharp)", function()
    local lspconfig_with_on_new_config = {
      testserver = {
        document_config = {
          default_config = {
            cmd = { "ls_original_cmd" },
            filetypes = { "test" },
            on_new_config = function(new_config, root_path)
              table.insert(new_config.cmd, "--path")
              table.insert(new_config.cmd, root_path)
            end,
          },
        },
      },
    }
    local cfg = helpers.server_configs(lspconfig_with_on_new_config, { testserver = "nix_pkg_name" }, {}, {})
    cfg.testserver.on_new_config(cfg.testserver, "/some/root/path")
    assert.same(
      { "nix-shell", "-p", "nix_pkg_name", "--run", "'ls_original_cmd' '--path' '/some/root/path'" },
      cfg.testserver.cmd
    )
  end)

  it("on_new_config updates cmd when callback builds a new one (e.g. eslint, codeqlls)", function()
    local lspconfig_with_on_new_config = {
      testserver = {
        document_config = {
          default_config = {
            cmd = { "ls_original_cmd" },
            filetypes = { "test" },
            on_new_config = function(new_config, root_path)
              new_config.cmd = { "new_cmd", "--path", root_path }
            end,
          },
        },
      },
    }
    local cfg = helpers.server_configs(lspconfig_with_on_new_config, { testserver = "nix_pkg_name" }, {}, {})
    cfg.testserver.on_new_config(cfg.testserver, "/some/root/path")
    assert.same({ "nix-shell", "-p", "nix_pkg_name", "--run", "'new_cmd' '--path' '/some/root/path'" },
      cfg.testserver.cmd)
  end)

  it("on_new_config from user config takes precedence", function()
    local lspconfig_with_on_new_config = {
      testserver = {
        document_config = {
          default_config = {
            cmd = { "ls_original_cmd" },
            filetypes = { "test" },
            on_new_config = function(new_config, root_path)
              new_config.cmd = { "default_config_cmd", "--path", root_path }
            end,
          },
        },
      },
    }
    local cfg = helpers.server_configs(
      lspconfig_with_on_new_config,
      { testserver = "nix_pkg_name" },
      {
        configs = {
          testserver = {
            on_new_config = function(new_config, root_path)
              new_config.cmd = { "user_config_cmd", "--path", root_path }
            end,
          },
        },
      },
      {}
    )
    cfg.testserver.on_new_config(cfg.testserver, "/some/root/path")
    assert.same(
      { "nix-shell", "-p", "nix_pkg_name", "--run", "'user_config_cmd' '--path' '/some/root/path'" },
      cfg.testserver.cmd
    )
  end)

  it("don't wrap result from on_new_config if it is already wrapped", function()
    local cfg = helpers.server_configs(
      testserver_lspconfig,
      { testserver = "nix_pkg_name" },
      {
        configs = {
          testserver = {
            on_new_config = function(new_config, root_path)
              new_config.cmd = helpers.in_shell({ "user_pkg_name" }, new_config.cmd)
            end,
          },
        },
      },
      {}
    )
    cfg.testserver.on_new_config(cfg.testserver, "")
    assert.same({ "nix-shell", "-p", "user_pkg_name", "--run", "'ls_original_cmd'" }, cfg.testserver.cmd)
  end)

  it("augments commands with nix-shell", function()
    local cfg = helpers.server_configs(fake_lspconfig, fake_servers, {}, fake_overrides)
    assert.same({ "nix-shell", "-p", "fakelsp-package", "--run", "'fakelsp-binary'" }, make_config(cfg.fakelsp).cmd)
    assert.same(
      { "nix-shell", "-p", "python39Packages.python-lsp-server", "--run", "'pylsp'" },
      make_config(cfg.pylsp).cmd
    )
    assert.same(
      { "nix-shell", "-p", "pyright", "--run", "'pyright-langserver' '--stdio'" },
      make_config(cfg.pyright).cmd
    )
    assert.same({
      "nix-shell",
      "-p",
      "nodePackages.typescript-language-server",
      "nodePackages.typescript",
      "--run",
      "'typescript-language-server' '--stdio'",
    }, make_config(cfg.tsserver).cmd)
  end)

  it("removes excluded servers", function()
    local cfg = helpers.server_configs(fake_lspconfig, fake_servers, {
      excluded_servers = { "pylsp", "pyright", "tsserver" },
    }, fake_overrides)
    assert.same({ "nix-shell", "-p", "fakelsp-package", "--run", "'fakelsp-binary'" }, make_config(cfg.fakelsp).cmd)
    assert.is_nil(cfg.pylsp)
    assert.is_nil(cfg.pyright)
    assert.is_nil(cfg.tsserver)
  end)

  it("uses default filetypes", function()
    local cfg = helpers.server_configs(fake_lspconfig, fake_servers, {}, fake_overrides)
    table.sort(cfg.fakelsp.filetypes)
    table.sort(cfg.pylsp.filetypes)
    table.sort(cfg.pyright.filetypes)
    table.sort(cfg.tsserver.filetypes)
    assert.same({ "javascript", "python", "typescript" }, cfg.fakelsp.filetypes)
    assert.same({ "python" }, cfg.pylsp.filetypes)
    assert.same({ "python" }, cfg.pyright.filetypes)
    assert.same({ "javascript", "typescript" }, cfg.tsserver.filetypes)
  end)

  it("sets filetypes based on preferred_servers option", function()
    local cfg = helpers.server_configs(fake_lspconfig, fake_servers, {
      preferred_servers = {
        python = { "pyright" },
        typescript = "tsserver",
      },
    }, fake_overrides)
    table.sort(cfg.fakelsp.filetypes)
    table.sort(cfg.pyright.filetypes)
    table.sort(cfg.tsserver.filetypes)
    assert.is_nil(cfg.pylsp)
    assert.same({ "javascript" }, cfg.fakelsp.filetypes)
    assert.same({ "python" }, cfg.pyright.filetypes)
    assert.same({ "javascript", "typescript" }, cfg.tsserver.filetypes)
  end)

  it("removes servers without specified cmd", function()
    local lspconfig = {
      fakelsp = {
        document_config = {
          default_config = { filetypes = { "javascript" } },
        },
      },
    }
    local cfgs = helpers.server_configs(lspconfig, fake_servers, {}, fake_overrides)
    assert.same({}, cfgs)
  end)

  it("excluded_servers takes priority over preferred_servers", function()
    local cfgs = helpers.server_configs(fake_lspconfig, fake_servers, {
      excluded_servers = {
        "pyright",
      },
      preferred_servers = {
        python = { "pyright" },
      },
    }, fake_overrides)
    assert.is_nil(cfgs.pyright)
  end)

  describe("prefer_local", function()
    local empty_overrides = {}
    local locally_installed_binary = "git"
    local lspconfig_with_binary = {
      fakelsp = {
        document_config = {
          default_config = { filetypes = { "fake" }, cmd = { locally_installed_binary } },
        },
      },
    }

    it("prefers local binary by default", function()
      local cfgs = helpers.server_configs(lspconfig_with_binary, fake_servers, {}, empty_overrides)
      assert.same({ "git" }, make_config(cfgs.fakelsp).cmd)
    end)

    it("wraps in shell when option false", function()
      local cfgs =
          helpers.server_configs(lspconfig_with_binary, fake_servers, { prefer_local = false }, empty_overrides)
      assert.same({ "nix-shell", "-p", "fakelsp-package", "--run", "'git'" }, make_config(cfgs.fakelsp).cmd)
    end)

    it("uses local binary when option true", function()
      local cfgs = helpers.server_configs(lspconfig_with_binary, fake_servers, { prefer_local = true }, empty_overrides)
      assert.same({ "git" }, make_config(cfgs.fakelsp).cmd)
    end)

    local non_existing_binary = "this-does-not-exist"
    local lspconfig_without_binary = {
      fakelsp = {
        document_config = {
          default_config = { filetypes = { "fake" }, cmd = { non_existing_binary } },
        },
      },
    }
    it("wraps in shell when binary not found", function()
      local cfgs =
          helpers.server_configs(lspconfig_without_binary, fake_servers, { prefer_local = true }, empty_overrides)
      assert.same(
        { "nix-shell", "-p", "fakelsp-package", "--run", "'this-does-not-exist'" },
        make_config(cfgs.fakelsp).cmd
      )
    end)
  end)
end)

it("replace_first", function()
  assert.same({ "cmd_b", "--some", "arg" }, helpers.replace_first({ "cmd_a", "--some", "arg" }, "cmd_b"))
end)
