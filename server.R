library(shiny)
shinyServer(function(input, output) {
  datafile <- callModule(free, "free", stringsAsFactors = FALSE)
  callModule(tables.server, "stf", table.name="Staffs")
  callModule(tables.server, "drv", table.name="Drivers")
  callModule(tables.server, "car", table.name="Cars")
  callModule(tables.server, "phnn", table.name="DriverPhones")
  callModule(tables.server, "supstf", table.name="SupporterStaffs")
  callModule(tables.server, "user", table.name="Users")
  callModule(tables.server, "discod", table.name="DiscountCodes")
  callModule(tables.server, "trvl", table.name="Travels")
  callModule(tables.server, "dest", table.name="TravelDestinations")
  callModule(tables.server, "userp", table.name="Userp") # ????????
  callModule(tables.server, "userdiscod", table.name="UserDiscountCodes")
  callModule(tables.server, "favaddrss", table.name="UserFavouriteAddresses")
  callModule(tables.server, "sprvsn", table.name="CommentsOnOrders")
  
  
  output$table <- renderDataTable({
    datafile()
  })
})
