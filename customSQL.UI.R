customSQL.UI <- function(id, label = "firstTry"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(column(3,h3("Go"),actionButton(ns("search"), label = "go")), column(7,textAreaInput(ns("texput"),label = h3("sql command"))))
      ,
      fluidRow(dataTableOutput(ns("table")))
    )
    
  )
}
