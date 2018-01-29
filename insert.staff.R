insert.staff <- function(input, output, session) {
  datasetInput <- eventReactive(input$insert, {
    # print('btn clicked')
    # staff_query <- 'INSERT INTO staffs(STFID, CID, STFName, STFLName) VALUES ('
    stfid = input$sid
    cid = input$cid
    name = paste('\'',input$name,'\'', sep = '')
    lastname = paste('\'',input$lastname,'\'', sep = '')
    carType = paste('\'',input$carType,'\'', sep = '')
    cartPic = paste('\'',input$cartPic,'\'', sep = '')
    avatar = paste('\'',input$avatar,'\'', sep = '')
    staff_query <- insert.query('staffs', parameters = c(stfid, cid, name, lastname) )
    driver_query <- insert.query('cars', parameters = c(stfid, carType, 'NULL', 'NULL', cartPic[1], 4.0, avatar[1]))
    # staff_query = paste(staff_query,paste(stfid,cid,name,lastname, sep = ' ,'), ')')
    tryCatch(
      {
        dbSendQuery(db.connection, staff_query)
        # dbSendQuery(db.connection, driver_query)
        return('New staff has been added successfully!')
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
