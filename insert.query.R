insert.query <- function(table.name, parameters){
  query <- "INSERT INTO "
  query <- paste(query, table.name, sep = '')
  query <- paste(query, 'VALUES(', sep = ' ')
  query <- paste(query, paste(unlist(parameters), collapse=' ,'))
  query <- paste(query, ' )')
  print(query)
  return(query)
}
