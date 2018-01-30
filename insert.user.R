insert.user <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    userphn = input$userphn
    username = paste('\'',input$username,'\'', sep = '')
    userlname = paste('\'',input$userlname,'\'', sep = '')
    usermail = paste('\'',input$usermail,'\'', sep = '')
    usercrt = 0
    if (!is.null(input$usercrt)){
      usercrt = input$usercrt
    }
    useravatar = paste('\'',input$useravatar,'\'', sep = '')
    userpave = 0
    userref = 'NULL'
    if (!is.null(input$userref)){
      userref = input$userref
    }
    userphnii = 'NULL'
    if (!is.null(input$userphnii)){
      userphnii = input$userphnii
    }
    query <- insert.query('users', parameters = c(userphn, username, userlname, usermail, usercrt, useravatar[1], userpave, userref, userphnii))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New User has been added successfully!')
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



