insert.discountcode.UI <- function(id, label = "insert.discountcode"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("codid"),label = h6("ID"))),
        column(3, textInput(ns("codtype"),label = h6("Type"))),
        column(3, dateInput(ns("codexpdate"),label = h6("Expiration Date"))),
        column(3, textInput(ns("codpers"),label = h6("Credit"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
