insert.driverphone <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    stfid = input$stfid
    hmphnn = input$hmphn
    mobphn = input$mobphn
    query <- insert.query('driverphones', parameters = c(stfid, hmphnn, mobphn))
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
