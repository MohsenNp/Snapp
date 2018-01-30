insert.driverphone <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    stfid = input$stfid
    hmphnn = input$hmphn
    mobphn = input$mobphn
    query <- insert.query('driverphones', parameters = c(stfid, hmphnn, mobphn))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New DriverPhone has been added successfully!')
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
