library(shiny)
usertype <- 0
server = (function(input, output,session) {
  
  USER <- reactiveValues(Logged = FALSE)
  
  observe({ 
    if (USER$Logged == FALSE) {
      if (!is.null(input$Login)) {
        if (input$Login > 0) {
          Username <- isolate(input$userName)
          Password <- isolate(input$passwd)
          Id.username <- which(user_pass[1] == Username)
          Id.password <- which(user_pass[2] == Password)
          if (length(Id.username) > 0 & length(Id.password) > 0) {
            if (Id.username == Id.password) {
              USER$Logged <- TRUE
              if (Id.username == 'admin'){
                usertype = 1;
              } else if (Id.username == 'mohsen'){
                usertype = 2;
              } else {
                usertype = 3;
              }
            } 
          }
        }
      }
    }    
  })
  observeEvent(input$logout_btn, {
    USER$Logged <- FALSE
    output$page <- renderUI({
      div(class="outer",do.call(bootstrapPage,c("",login.UI())))
    })
    
  })
  observe({
    if (USER$Logged == FALSE) {
      output$page <- renderUI({
        div(class="outer",do.call(bootstrapPage,c("",login.UI())))
      })
      output$logo <- renderImage({
        return(list(
          src = "./images/Snapp-logo.png",
          contentType = "image/png",
          alt = "Face",
          width = 450,
          height = 200,
          background = FALSE
        ))
        }, deleteFile = FALSE)
      # output$icon <- renderImage({
      #   return(list(
      #     src = "./images/Snapp-logo.png",
      #     contentType = "image/png",
      #     width = 100,
      #     height = 28,
      #     background = FALSE
      #   ))
      # }, deleteFile = FALSE)
      # output$page <- renderUI(login.UI())
    }
    if (USER$Logged == TRUE) 
    {
      if (usertype == 1){
        output$page <- renderUI(admin.UI())
        datafile <- callModule(customSQL, "customSQL", stringsAsFactors = FALSE)
      } else if (usertype == 2){
        output$page <- renderUI(user.UI())
      } else {
        output$page <- renderUI(driver.UI())
      }
      callModule(tables.server, "stf", table.name="Staffs")
      callModule(tables.server, "uservi", table.name="uservi", view=TRUE)
      callModule(tables.server, "drivevi", table.name="drivevi", view=TRUE)
      callModule(tables.server, "supstfvi", table.name="supstfvi", view=TRUE)
      callModule(tables.server, "drv", table.name="Drivers")
      callModule(tables.server, "car", table.name="Cars")
      callModule(tables.server, "phnn", table.name="DriverPhones")
      callModule(tables.server, "supstf", table.name="SupporterStaffs")
      callModule(tables.server, "user", table.name="Users")
      callModule(tables.server, "discod", table.name="DiscountCodes")
      callModule(tables.server, "trvl", table.name="Travels")
      callModule(tables.server, "dest", table.name="TravelDestinations")
      callModule(tables.server, "userdiscod", table.name="UserDiscountCodes")
      callModule(tables.server, "favaddrss", table.name="UserFavouriteAddresses")
      callModule(tables.server, "sprvsn", table.name="CommentsOnTravels")
      callModule(insert.driver, "insert.driver")
      callModule(insert.car, "insert.car")
      callModule(insert.user, "insert.user")
      callModule(insert.driverphone, "insert.driverphone")
      callModule(insert.travel, "insert.travel")
      callModule(insert.traveldest, "insert.traveldest")
      callModule(insert.supporter.staff, "insert.supporter.staff")
      callModule(insert.userdiscod, "insert.userdiscod")
      callModule(insert.userfavaddr, "insert.userfavaddr")
      callModule(insert.discountcode, "insert.discountcode")
      callModule(insert.comontrv, "insert.comontrv")
      output$table <- renderDataTable({
        datafile()
      })
    }
  })
  observe({
    
  }
  )
})

