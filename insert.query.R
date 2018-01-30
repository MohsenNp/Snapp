insert.query <- function(table.name, fields = NULL, parameters){
  query <- paste("INSERT INTO ", table.name, sep = '')
  if (!is.null(fields)){
    query <- paste(query, "(", sep = "")
    query <- paste(query, fields[1], sep = "")
    for (i in 2:length(fields)){
      query <- paste(query, fields[i], sep = ", ")
      print(query)
    }
    query <- paste(query, ")", sep = "")
  }
  query <- paste(query, 'VALUES(', sep = ' ')
  query <- paste(query, paste(unlist(parameters), collapse=' ,'))
  query <- paste(query, ' )')
  print(query)
  return(query)
}
