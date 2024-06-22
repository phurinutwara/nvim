local statements = {
  simple = "console.log('%s',%s)",
  verbose = "console.log('%s', require('util').inspect(%s, { showHidden: false, depth: null, colors: true }));",
}

return {
  statements = statements,
}
