insert.userfavaddr <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    userphn = input$userphn
    addr = paste('\'',input$addr,'\'', sep = '')
    query <- insert.query('traveldestinations', parameters = c(userphn, addr))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New Favourite Address for this user has been added successfully!')
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

