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
        textInput("userName", "Username", value = "admin"),theme = shinytheme("superhero"),
        passwordInput("passwd", "Password", width = 224, value = "admin"),
        br(),actionButton("Login", "Log in")),
        tags$style(type = "text/css", "#login {font-size:10px;   text-align: left;position:absolute;top: 55%;left: 75%;margin-top: -150px;margin-left: -150px}"
      )
    )
    
  )
}
admin.UI <- function(){
  fluidPage(theme = shinytheme("superhero"), title = "Snapp!",
    navbarPage("Snapp", theme = shinytheme("superhero"),imageOutput("icon"),
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
                          tabPanel("UserDiscountCodes", tables.UI("userdiscod", "userdiscod")),
                          tabPanel("UserFavouriteAddresses", tables.UI("favaddrss", "favaddrss")),
                          tabPanel("CommentsOnOrders", tables.UI("sprvsn", "sprvsn")),
                          tabPanel("Information", tables.UI("supstfvi", "supstfvi"))
                        )),
               tabPanel("Insert",
                        navlistPanel(
                          tabPanel("Driver", insert.driver.UI("insert.driver")),
                          tabPanel("Cars", insert.car.UI("insert.car")),
                          tabPanel("DriverPhone", insert.driverphone.UI("insert.driverphone")),
                          tabPanel("Users", insert.user.UI("insert.user")),
                          tabPanel("DiscountCodes", insert.discountcode.UI("insert.discountcode")),
                          tabPanel("Travels", insert.travel.UI("insert.travel")),
                          tabPanel("TravelDestinations", insert.traveldest.UI("insert.traveldest")),
                          tabPanel("UserDiscountCodes", insert.userdiscod.UI("insert.userdiscod")),
                          tabPanel("UserFavouriteAddresses", insert.userfavaddr.UI("insert.userfavaddr")),
                          tabPanel("SupporterStaff", insert.supporter.staff.UI("insert.supporter.staff")),
                          tabPanel("CommentsOnTravels", insert.comontrv.UI("insert.comontrv"))
                        )),
               tabPanel("Custom SQL!", customSQL.UI("customSQL"))
              )
    
  )
}
driver.UI <- function(){
  fluidPage(theme = shinytheme("superhero"),
            navbarPage("Snapp", theme = shinytheme("superhero"),imageOutput("icon"),
                       tabPanel("Queries",
                                navlistPanel(
                                  "Tables",
                                  tabPanel("DriverInformation", tables.UI("drivevi", "drivevi")),
                                  tabPanel("Cars", tables.UI("car", "car")),
                                  tabPanel("DriverPhones", tables.UI("phnn", "phnn")),
                                  tabPanel("SupporterStaffs", tables.UI("supstf", "supstf")),
                                  tabPanel("Travels", tables.UI("trvl", "trvl")),
                                  tabPanel("TravelDestinations", tables.UI("dest", "dest"))
                                )),
                       tabPanel("Update",
                                navlistPanel(
                                  tabPanel("DriverInformation", insert.driver.UI("insert.driver")),
                                  tabPanel("Cars", insert.car.UI("insert.car")),
                                  tabPanel("DriverPhone", insert.driverphone.UI("insert.driverphone")),
                                  tabPanel("Travels", insert.travel.UI("insert.travel"))
                                ))
            )
            
  )
}

user.UI <- function(){
  fluidPage(theme = shinytheme("superhero"),
            navbarPage("Snapp", theme = shinytheme("superhero"),imageOutput("icon"),
                       tabPanel("Queries",
                                navlistPanel(
                                  "Tables",
                                  tabPanel("SupporterStaffs", tables.UI("supstf", "supstf")),
                                  tabPanel("UserInformation", tables.UI("uservi", "uservi")),
                                  tabPanel("Travels", tables.UI("trvl", "trvl")),
                                  tabPanel("TravelDestinations", tables.UI("dest", "dest")),
                                  tabPanel("UserDiscountCodes", tables.UI("userdiscod", "userdiscod")),
                                  tabPanel("UserFavouriteAddresses", tables.UI("favaddrss", "favaddrss")),
                                  tabPanel("CommentsOnOrders", tables.UI("sprvsn", "sprvsn"))
                                )),
                       tabPanel("Update",
                                navlistPanel(
                                  tabPanel("UserInformation", insert.user.UI("update.user")),
                                  tabPanel("DiscountCodes", insert.discountcode.UI("insert.discountcode")),
                                  tabPanel("Travels", insert.travel.UI("insert.travel")),
                                  tabPanel("TravelDestinations", insert.traveldest.UI("insert.traveldest")),
                                  tabPanel("UserDiscountCodes", insert.userdiscod.UI("insert.userdiscod")),
                                  tabPanel("UserFavouriteAddresses", insert.userfavaddr.UI("update.userfavaddr")),
                                  tabPanel("CommentsOnTravels", insert.comontrv.UI("insert.comontrv"))
                                ))
            )
            
  )
}

ui = (htmlOutput("page"))

# runApp(list(ui = ui, server = server))

