insert.car <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    carclr = paste('\'',input$carclr,'\'', sep = '')
    carmdl = paste('\'',input$carmdl,'\'', sep = '')
    carprdct = input$carprdct
    stfid = input$stfid
    car_query <- insert.query('cars', fields = c("carclr", "carmdl", "carprdct", "stfid"), parameters = c(carclr, carmdl, carprdct, stfid))
    tryCatch(
      {
        dbSendQuery(db.connection, car_query)
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
