insert.driverphone.UI <- function(id, label = "insert.driverphone"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("stfid"),label = h6("Driver ID"))),
        column(3, textInput(ns("hmphn"),label = h6("Home phone"))),
        column(3, textInput(ns("mobphn"),label = h6("Mobile Phone"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
