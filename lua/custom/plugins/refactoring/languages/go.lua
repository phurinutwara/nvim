local statements = {
  simple = 'fmt.Println(fmt.Sprintf("%s: %%+v", %s))',
  verbose = 'fmt.Println(fmt.Sprintf("%s: %%#v", %s))',
}

return {
  statements = statements,
}
