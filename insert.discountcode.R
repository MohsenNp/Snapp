insert.discountcode <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    codid = input$codid
    codtype = paste('\'',input$codtype,'\'', sep = '')
    codexpdate = paste('\'',input$codexpdate,'\'', sep = '')
    codpers = input$codpers
    query <- insert.query('discountcodes',parameters = c(codid, codtype, codexpdate, codpers))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('Query Accepted!')
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
