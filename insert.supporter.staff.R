insert.supporter.staff <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    stfid = input$stfid
    acsslvl = input$acsslvl
    rgn = input$rgn
    query <- insert.query('supporterstaff', parameters = c(stfid, acsslvl, rgn))
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

