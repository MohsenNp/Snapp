insert.travel <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    trvlid = input$trvlid
    paytype = paste('\'',input$paytype,'\'', sep = '')
    cst = input$cst
    strtpntx = 0
    strtpnty = 0
    userphn = input$userphn
    drvid = input$stfid
    query <- insert.query('travels',parameters = c(trvlid, paytype, cst, strtpntx, strtpnty, userphn, drvid))
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
