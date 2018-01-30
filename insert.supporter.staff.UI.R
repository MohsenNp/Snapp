insert.supporter.staff.UI <- function(id, label = "insert.supporter.staff"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("stfid"),label = h6("Driver ID"))),
        column(3, textInput(ns("acsslvl"),label = h6("Access Level"))),
        column(3, textInput(ns("rgn"),label = h6("Region"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
