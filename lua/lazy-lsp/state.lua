local M = {}

M.issues = {}

function M.add_issue(issue)
  table.insert(M.issues, issue)
end

function M.get_issues()
  return M.issues
end

function M.clear_issues()
  M.issues = {}
end

return M
