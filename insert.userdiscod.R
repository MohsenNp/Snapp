insert.userdiscod <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    userphn = input$userphn
    codid = input$codid
    query <- insert.query('userdiscountcodes', parameters = c(userphn, codid))
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

