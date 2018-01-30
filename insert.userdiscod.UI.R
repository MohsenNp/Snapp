insert.userdiscod.UI <- function(id, label = "insert.userdiscod"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("userphn"),label = h6("User Phone"))),
        column(3, textInput(ns("codid"),label = h6("Discount Code ID"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
