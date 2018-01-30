insert.supporter.staff <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    stfid = input$stfid
    cid = input$cid
    name = paste('\'',input$name,'\'', sep = '')
    lastname = paste('\'',input$lastname,'\'', sep = '')
    acsslvl = input$acsslvl
    rgn = input$rgn
    is.driver <- 'FALSE'
    staff_query <- insert.query('staffs', parameters = c(stfid, cid, name, lastname, is.driver) )
    query <- insert.query('supporterstaffs', parameters = c(stfid, acsslvl, rgn))
    tryCatch(
      {
        dbSendQuery(db.connection, staff_query)
        dbSendQuery(db.connection, query)
        return('New Supporter Staff has been added successfully!')
      },
      warning = function(war) {
        return('Query Failed!')
        
      }, error = function(err) {
        
        # error handler picks up where error was generated
        return('Query Failed!')
      }
    )
  }
  )
  
  output$output <- renderText(
    datasetInput()
  )
}

