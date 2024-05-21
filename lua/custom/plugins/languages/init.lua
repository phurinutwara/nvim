-- local import_tbl = {}
--
-- local scriptPath = debug.getinfo(1).source:match '@?(.*/)'
-- scriptPath = string.sub(scriptPath, 1, string.len(scriptPath) - 1)
--
-- local list = io.popen(("find '%s' -type d"):format(scriptPath))
-- for f in list:lines() do
--   if f ~= scriptPath then
--     local importPath = f:match('custom.*[^/]'):gsub('/', '.')
--     table.insert(import_tbl, { import = importPath })
--   end
-- end
--
-- return import_tbl

return {
  import = 'custom.plugins.languages',
}
