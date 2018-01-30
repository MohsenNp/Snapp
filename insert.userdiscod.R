insert.userdiscod <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    userphn = input$userphn
    codid = input$codid
    query <- insert.query('userdiscountcodes', parameters = c(userphn, codid))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New User Discount has been added successfully!')
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

