insert.traveldest <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    trvlid = input$trvlid
    dest = paste('\'',input$dest,'\'', sep = '')
    query <- insert.query('traveldestinations', parameters = c(trvlid, dest))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New Travel Destination has been added successfully!')
      },
      warning = function(war) {
        return('Query Failed')
        
      }, error = function(err) {
        
        # error handler picks up where error was generated
        return('Query Failed')
      }
    )
  }
  )
  
  output$output <- renderText(
    datasetInput()
  )
}

