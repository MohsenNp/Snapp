insert.driver.UI <- function(id, label = "insert.driver"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("sid"),label = h6("Staff ID"))),
        column(3, textInput(ns("cid"),label = h6("National ID"))),
        column(3, textInput(ns("name"),label = h6("Name"))),
        column(3, textInput(ns("lastname"),label = h6("Last Name"))),
        column(3, textInput(ns("carType"),label = h6("Car Type"))),
        column(3, fileInput(ns("cartPic"),label = h6("Cart picture"))),
        column(3, fileInput(ns("avatar"),label = h6("Driver Avatar"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
        )
      ,
      fluidRow(textOutput(ns("output")))
    )
    
  )
}
