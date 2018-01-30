insert.user <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    userphn = input$userphn
    username = paste('\'',input$username,'\'', sep = '')
    userlname = paste('\'',input$userlname,'\'', sep = '')
    usermail = paste('\'',input$usermail,'\'', sep = '')
    usercrt = input$usercrt
    useravatar = paste('\'',input$useravatar,'\'', sep = '')
    userpave = 0
    userref = input$userref
    userphnii = input$userphnii
    query <- insert.query('driverphones', parameters = c(userphn, username, userlname, usermail, usercrt, useravatar[1], userpave, userref, userphnii))
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



