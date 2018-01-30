insert.comontrv <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    userphn = input$userphn
    trvlid = input$trvlid
    drvid = input$drvid
    supid = input$supid
    query <- insert.query('commentsontravels', parameters = c(userphn, trvlid, drvid, supid))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New Objection has been added successfully!')
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

