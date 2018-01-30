insert.traveldest.UI <- function(id, label = "insert.traveldest"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("trvlid"),label = h6("Travel ID"))),
        column(3, textInput(ns("dest"),label = h6("Destinations"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
