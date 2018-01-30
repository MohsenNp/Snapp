insert.travel.UI <- function(id, label = "insert.travel"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, selectInput(ns("paytype"),label = h6("Pay Type"), choices = c("SnappBox" = "box", "SnappTaxi" = "taxi"))) ,
        column(3, textInput(ns("cst"),label = h6("Cost"))),
        column(3, textInput(ns("userphn"),label = h6("User Phone"))),
        column(3, textInput(ns("stfid"),label = h6("Driver ID"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
