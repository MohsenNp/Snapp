insert.driver <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    # print('btn clicked')
    # staff_query <- 'INSERT INTO staffs(STFID, CID, STFName, STFLName) VALUES ('
    stfid = input$sid
    cid = input$cid
    name = paste('\'',input$name,'\'', sep = '')
    lastname = paste('\'',input$lastname,'\'', sep = '')
    cartPic = paste('\'',input$cartPic,'\'', sep = '')
    avatar = paste('\'',input$avatar,'\'', sep = '')
    staff_query <- insert.query('staffs', parameters = c(stfid, cid, name, lastname) )
    driver_query <- insert.query('drivers', parameters = c(stfid, 'NULL', 'NULL', cartPic[1], 4.0, avatar[1]))
    tryCatch(
      {
        dbSendQuery(db.connection, staff_query)
        dbSendQuery(db.connection, driver_query)
        return('New Driver has been added Successfully!')
      },
      warning = function(war) {
        print('Query Failed')

      }, error = function(err) {

        # error handler picks up where error was generated
        print('Query Failed')
      }
    )
    }
  )
  
  output$output <- renderText(
    datasetInput()
  )
}
