rm(list = ls())
library(shiny)
library(shinythemes)

Logged = FALSE;
user_pass <- data.frame(user = c('admin', 'hamid', 'mohsen'), pass <- c('admin', 'hamid', 'mohsen'))

login.UI <- function(){
  fluidPage(
    theme = shinytheme("superhero"),
    fluidRow(
      theme = shinytheme("superhero"),
      wellPanel(
        id = 'snappLogo',
        imageOutput('logo', height = 200),
        tags$style(type = "text/css", "#snappLogo {text-align: left;position:absolute;top: 50%;left: 20%;margin-top: -150px;margin-left: -150px}")
      )
    ),
    fluidRow(
      theme= shinytheme("superhero"),
      wellPanel( 
        id = 'welcomeMsg',
        theme= shinytheme("superhero"),
        h3("Welcome To Snapp!"),
        tags$style(type = "text/css", "#welcomeMsg {font-size:10px;   text-align: left;position:absolute;top: 45%;left: 75%;margin-top: -150px;margin-left: -150px}")
      )
    ),
    fluidRow(
      theme= shinytheme("superhero"),
      wellPanel(
        id = 'login',
        textInput("userName", "Username"),theme = shinytheme("superhero"),
        passwordInput("passwd", "Password", width = 224),
        br(),actionButton("Login", "Log in")),
        tags$style(type = "text/css", "#login {font-size:10px;   text-align: left;position:absolute;top: 55%;left: 75%;margin-top: -150px;margin-left: -150px}"
      )
    )
    
  )
}
snapp.UI <- function(){
  # tagList(tabPanel("Test"))
  fluidPage(theme = shinytheme("superhero"),
    navbarPage(theme = shinytheme("superhero"),"Snapp database",
               tabPanel("Queries",
                        navlistPanel(
                          "Tables",
                          tabPanel("Staffs", tables.UI("stf", "stf")),
                          tabPanel("Drivers", tables.UI("drv", "drv")),
                          tabPanel("Cars", tables.UI("car", "car")),
                          tabPanel("DriverPhones", tables.UI("phnn", "phnn")),
                          tabPanel("SupporterStaffs", tables.UI("supstf", "supstf")),
                          tabPanel("Users", tables.UI("user", "user")),
                          tabPanel("DiscountCodes", tables.UI("discod", "discod")),
                          tabPanel("Travels", tables.UI("trvl", "trvl")),
                          tabPanel("TravelDestinations", tables.UI("dest", "dest")),
                          # tabPanel("Userp", tables.UI("userp", "userp")), # ?????
                          tabPanel("UserDiscountCodes", tables.UI("userdiscod", "userdiscod")),
                          tabPanel("UserFavouriteAddresses", tables.UI("favaddrss", "favaddrss")),
                          tabPanel("CommentsOnOrders", tables.UI("sprvsn", "sprvsn"))
                        )),
               tabPanel("Insert",
                        navlistPanel(
                          tabPanel("Drivers"),
                          tabPanel("Staffs", insert.staff.UI("insertStaff"))
                        )),
               tabPanel("Custom SQL!", customSQL.UI("customSQL"))
              )
    
  )
}

ui = (htmlOutput("page"))

# runApp(list(ui = ui, server = server))

