insert.user.UI <- function(id, label = "insert.user"){
  ns <- NS(id)
  
  tagList(
    fluidPage(
      fluidRow(
        column(3, textInput(ns("userphn"),label = h6("Phone Number"))),
        column(3, textInput(ns("username"),label = h6("Name"))),
        column(3, textInput(ns("userlname"),label = h6("Last Name"))),
        column(3, textInput(ns("usermail"),label = h6("E-Mail"))),
        column(3, textInput(ns("usercrt"),label = h6("Credit"))),
        column(3, fileInput(ns("useravatar"),label = h6("Avatar"))),
        column(3, textInput(ns("userref"),label = h6("Reference(if Any)"))),
        column(3, textInput(ns("userphnii"),label = h6("Reference PhoneNumber(if Any)"))),
        column(5, actionButton(ns("insert"), "add", style='padding:20px; font-size:80%'))
      )
      ,
      fluidRow(textOutput(ns("output")))
    )
  )
}
