insert.car <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    carclr = paste('\'',input$carclr,'\'', sep = '')
    carmdl = paste('\'',input$carmdl,'\'', sep = '')
    carprdct = input$carprdct
    stfid = 'NULL'
    if (!is.null(input$stfid)){
      stfid = input$stfid
    }
    car_query <- insert.query('cars', fields = c("carclr", "carmdl", "carprdct", "stfid"), parameters = c(carclr, carmdl, carprdct, stfid))
    tryCatch(
      {
        dbSendQuery(db.connection, car_query)
        return('New Car has been added Successfully!')
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
