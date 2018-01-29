library(shiny)

shinyUI(
  navbarPage("Snapp database",
             tabPanel("Queries",
                      navlistPanel(
                        "Tables",
                        tabPanel("Staffs", tables.UI("stf")),
                        tabPanel("Drivers", tables.UI("drv")),
                        tabPanel("Cars", tables.UI("car")),
                        tabPanel("DriverPhones", tables.UI("phnn")),
                        tabPanel("SupporterStaffs", tables.UI("supstf")),
                        tabPanel("Users", tables.UI("user")),
                        tabPanel("DiscountCodes", tables.UI("discod")),
                        tabPanel("Travels", tables.UI("trvl")),
                        tabPanel("TravelDestinations", tables.UI("dest")),
                        tabPanel("Userp", tables.UI("userp")), # ?????
                        tabPanel("UserDiscountCodes", tables.UI("userdiscod")),
                        tabPanel("UserFavouriteAddresses", tables.UI("favaddrss")),
                        tabPanel("CommentsOnOrders", tables.UI("sprvsn"))
                      )),
             # tabPanel("Insert",
             #          navlistPanel(
             #            # tabPanel("Book Table", bookInputUI("bookInput")),
             #            # tabPanel("User Table", userInputUI("userInput"))
             #          )),
             tabPanel("Custom SQL!", freeUI("free"))
  )
)
