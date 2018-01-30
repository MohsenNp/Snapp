insert.traveldest <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    trvlid = input$trvlid
    dest = paste('\'',input$dest,'\'', sep = '')
    query <- insert.query('traveldestinations', parameters = c(trvlid, dest))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New car has been added successfully!')
      },
      warning = function(war) {
        return('data is invalid')
        
      }, error = function(err) {
        
        # error handler picks up where error was generated
        return('data is invalid')
      }
    )
  }
  )
  
  output$output <- renderText(
    datasetInput()
  )
}

