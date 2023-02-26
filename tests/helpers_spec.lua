local helpers = require "lazy-lsp.helpers"

describe("lazy-lsp", function()
  it("escape_shell_arg", function()
    assert.equals("'hello world'", helpers.escape_shell_arg("hello world"))
    assert.equals("'h\"i'", helpers.escape_shell_arg("h\"i"))
    assert.equals("'h'\"'\"'i'", helpers.escape_shell_arg("h'i"))
    assert.equals("''", helpers.escape_shell_arg(""))
  end)

  it("escape_shell_args", function()
    assert.equals("'hello world'", helpers.escape_shell_args({ "hello world" }))
    assert.equals("'hello world' 'h\"i' 'h'\"'\"'i'", helpers.escape_shell_args({ "hello world", "h\"i", "h'i" }))
    assert.equals("", helpers.escape_shell_args({}))
  end)
end)
