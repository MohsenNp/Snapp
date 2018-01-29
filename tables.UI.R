tables.UI <- function(id, label){
  ns <- NS(id)

  tagList(
    dataTableOutput(ns("table"))
  )
}
