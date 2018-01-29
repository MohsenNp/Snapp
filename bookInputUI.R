bookInputUI <- function(id, label = "BooksOfCont"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(2,h6("Insert"),actionButton(ns("insert"), label = "add")),
        column(2,selectInput (ns("viewpoint"),label = h6("Point Of View") , choices = list("first person" = 'first person', "third person" = 'third person', "omniscient" = 'omniscient'))),
        column(2,textInput(ns("topic"),label = h6("Topic"))),
        column(2,textInput(ns("title"),label = h6("Title"))),
        column(2,numericInput(ns("fpy"),label = h6("First Publish year"), value = 2017))        )
      ,
      fluidRow(textOutput(ns("output")))
    )
    
  )
}
