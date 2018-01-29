rm(list = ls())
library(shiny)

Logged = FALSE;
user_pass <- data.frame(user = c('admin', 'hamid', 'mohsen'), pass <- c('admin', 'hamid', 'mohsen'))

login.UI <- function(){
  tagList(
    div(id = "login",
        wellPanel(textInput("userName", "Username"),
                  passwordInput("passwd", "Password"),
                  br(),actionButton("Login", "Log in"))),
    tags$style(type="text/css", "#login {font-size:10px;   text-align: left;position:absolute;top: 40%;left: 50%;margin-top: -100px;margin-left: -150px;}")
  )}
logout.UI <- function(){
  
}
snapp.UI <- function(){
  # tagList(tabPanel("Test"))
  shinyUI(
    navbarPage("Snapp database",
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
                          tabPanel("Drivers")
                          # tabPanel("User Table", userInputUI("userInput"))
                        )),
               tabPanel("Custom SQL!", customSQL.UI("customSQL"))
    )
  )
}

ui = (htmlOutput("page"))

# runApp(list(ui = ui, server = server))

