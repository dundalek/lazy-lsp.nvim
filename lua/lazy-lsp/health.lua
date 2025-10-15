local M = {}

function M.check()
  local state = require("lazy-lsp.state")
  local issues = state.get_issues()

  vim.health.start("lazy-lsp")

  if #issues == 0 then
    vim.health.ok("No issues detected")
  else
    vim.health.info(string.format("Found %d issue(s)", #issues))
    for _, issue in ipairs(issues) do
      if issue.level == "warn" then
        vim.health.warn(issue.message)
      elseif issue.level == "error" then
        vim.health.error(issue.message)
      else
        vim.health.info(issue.message)
      end
    end
  end
end

return M
