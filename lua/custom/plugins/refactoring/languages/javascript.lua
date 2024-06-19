local print_var_statements = "console.log('%s', require('util').inspect(%s, { showHidden: false, depth: null, colors: true }));"

return {
  print_var_statements = print_var_statements,
}
