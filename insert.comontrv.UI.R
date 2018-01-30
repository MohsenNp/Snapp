insert.comontrv.UI <- function(id, label = "insert.comontrv"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("userphn"),label = h6("User Phone"))),
        column(3, textInput(ns("trvlid"),label = h6("Travel ID"))),
        column(3, textInput(ns("drvid"),label = h6("Driver ID"))),
        column(3, textInput(ns("supid"),label = h6("Supervisor ID"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
