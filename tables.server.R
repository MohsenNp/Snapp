tables.server <- function(input, output, session, table.name, query=NULL) {
  if (!dbExistsTable(db.connection, table.name)) {
    return()
  } else {
    if (is.null(query)){
      query <- paste("SELECT * FROM ", table.name, sep = '')
    }
    output$table <- renderDataTable(
      dbGetQuery(connect_database, query)
    )
  }
}