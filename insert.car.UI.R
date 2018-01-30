insert.car.UI <- function(id, label = "insert.car"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        # column(3, textInput(ns("carid"),label = h6("ID"))),
        column(3, textInput(ns("carclr"),label = h6("Color"))),
        column(3, textInput(ns("carmdl"),label = h6("Model"))),
        column(3, textInput(ns("carprdct"),label = h6("Production Year"))),
        column(3, textInput(ns("stfid"),label = h6("Driver ID"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
