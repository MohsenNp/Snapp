insert.supporter.staff.UI <- function(id, label = "insert.supporter.staff"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("stfid"),label = h6("SupporterStaff ID"))),
        column(3, textInput(ns("cid"),label = h6("National ID"))),
        column(3, textInput(ns("name"),label = h6("Name"))),
        column(3, textInput(ns("lastname"),label = h6("Last Name"))),
        column(3, textInput(ns("acsslvl"),label = h6("Access Level"))),
        column(3, textInput(ns("rgn"),label = h6("Region"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
