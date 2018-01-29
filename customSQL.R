free <- function(input, output, session, stringsAsFactors) {
  datasetInput <- eventReactive(input$search, {
    input$texput
  }
  )
  output$table <- renderDataTable(
    dbGetQuery(db.connection, paste(datasetInput()))
  )
}
