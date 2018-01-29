library(shiny)

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
                        tabPanel("Userp", tables.UI("userp", "userp")), # ?????
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
