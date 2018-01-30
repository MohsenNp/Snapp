tables.server <- function(input, output, session, table.name, query=NULL, view=FALSE, userphnn=0, drvid=0,supid=0) {
  table.name <- tolower(table.name)
  if (!dbExistsTable(db.connection, table.name) && view == FALSE && userphnn == 0 && drvid == 0 && supid == 0) {
    print(paste(table.name, "Table doesn't Exist", sep = ' '))
    return()
  } else {
    if (is.null(query)){
      query <- paste("SELECT * FROM ", table.name, sep = '')
    }
    output$table <- renderDataTable(
      dbGetQuery(db.connection, query, schema="snapp")
    )
  }
}