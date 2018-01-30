customSQL.UI <- function(id, label = "firstTry"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(column(12, h1('ATTENTION: Be Careful! :D')))
      ,
      fluidRow(column(3, h3("Execute"),actionButton(ns("search"), label = "Execute")), column(7,textAreaInput(ns("texput"),label = h3("SQL Command"))))
      ,
      fluidRow(dataTableOutput(ns("table")))
    )
    
  )
}
