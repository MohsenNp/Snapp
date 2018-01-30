insert.discountcode <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    codid = input$codid
    codtype = paste('\'',input$codtype,'\'', sep = '')
    codexpdate = paste('\'',input$codexpdate,'\'', sep = '')
    codpers = input$codpers
    query <- insert.query('cars',parameters = c(codid, codtype, codexpdate, codpers))
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
