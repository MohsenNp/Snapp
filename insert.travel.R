insert.travel <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    paytype = paste('\'',input$paytype,'\'', sep = '')
    ttype = paste('\'',input$ttype,'\'', sep = '')
    cst = input$cst
    strtpntx = 0
    strtpnty = 0
    userphn = input$userphn
    stfid = input$stfid
    query <- insert.query('travels',fields = c("paytype", "ttype", "cst", "strtpntx", "strtpnty", "userphn", "stfid"), parameters = c(paytype, ttype, cst, strtpntx, strtpnty, userphn, stfid))
    tryCatch(
      {
        dbSendQuery(db.connection, query)
        return('New Travel has been added successfully!')
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
