########################################################################
############################ UI #########################
########################################################################

#install.packages("shinyjs")

library(shinyjs)
library(stats)
library(shinydashboard)
library(sqldf)
library(rvest)
library(plotly)
library(shinycssloaders)
library(leaflet)
library(shiny)
library(shinyBS)

#setwd("D:/UserData/z0040k8p/Documents/Projects/Phoenix CDI_3.5.19/Data")

header <- dashboardHeader(
  title = "Scattergories",
  titleWidth = 300,
  dropdownMenu(type = "notifications",
               notificationItem(
                 text = "Designed by Nathan Hall",
                 icon = shiny::icon("info")               
               )
  )
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Game Options", tabName = "Opts", icon = icon("edit")),
    menuItem("Let's Play!", tabName = "Play", icon = icon("dice"))
  ) 
)



body <- dashboardBody(
  useShinyjs(),
  tabItems(
    tabItem(tabName="Opts",
            box(width=12,
                h1("Game Options",
                   align="center",
                   id="gameopts")
            ),
            tags$head(tags$style("#gameopts{
                                     padding: 40px;
                                     background-color:#3c8dbc;
                                     color:white;
                                     font-weight:bold;
                                     border: none;
                                     font-size: 55px;
                                     text-align: center;
                                     font-family: cursive;
                                     vertical-align: middle;
                                     }"
            )
            ),
            box(width=6,
                uiOutput("time_selector")
            ),
            box(width=2,
                uiOutput("difficulty_selector")
            ),
            box(width=4,
                uiOutput("category_selector")
            ),
            box(width=12,
                h3("Choose your game settings, then continue on to the 'Let's Play' tab. Note:
                    if you change the time limit, you MUST hit the 'Reset' button on the next tab
                    in order for your changes to be applied.
                    If you wish to change your game settings, you will need to close the game
                    by exiting the tab and re-navigating to this website.",
                   align="center",
                   id="descr"),
                tags$head(tags$style("#descr{
                                     padding: 20px;
                                     background-color:#3c8dbc;
                                     color:white;
                                     border: none;
                                     font-size: 24px;
                                     text-align: center;
                                     font-family: cursive;
                                     vertical-align: middle;
                                     }"
                )
                )
    )
    ),
    
    tabItem(tabName = "Play",
            box(width=5,
                height=190,
                uiOutput("letter"),
                tags$head(tags$style("#letter{color: #3c8dbc;
                                     font-size: 120px;
                                     font-style: bold;
                                     text-align: center;
                                     font-family: cursive;
                                     }"
                         )
                )
                ),
            box(width=7,
                uiOutput("newletter", align="center"),
                tags$head(tags$style("#newletter{-webkit-appearance: none;
                                     height: 75px;
                                     background-color:#3c8dbc;
                                     color:white;
                                     font-weight:bold;
                                     border: none;
                                     font-size: 32px;
                                     }"
                                     )
                )
                ),
            br(),
            box(width=4,
                uiOutput("start_timer", align="center"),
                tags$head(tags$style("#start{-webkit-appearance: none;
                                     height: 50px;
                                     background-color:#3c8dbc;
                                     color:white;
                                     font-weight:bold;
                                     border: none;
                                     font-size: 18px;
                                     }"
                )
                )
                ),
            
            box(width=3,
                uiOutput("reset_timer", align="center"),
                tags$head(tags$style("#reset{-webkit-appearance: none;
                                     height: 50px;
                                     background-color:#3c8dbc;
                                     color:white;
                                     font-weight:bold;
                                     border: none;
                                     font-size: 18px;
                                     }"
                )
                )
                ),
            box(width=6,
                uiOutput("scat1"),
                uiOutput("scat2"),
                uiOutput("scat3"),
                uiOutput("scat4"),
                uiOutput("scat5"),
                uiOutput("scat6"),
                tags$head(tags$style("#scat1,#scat2,#scat3,
                                     #scat4,#scat5,#scat6{color: black;
                                     font-size: 40px;
                                     font-style: bold;    
                                     text-align: left;}"
                )
                )
                ),
            box(width=6,
                uiOutput("scat7"),
                uiOutput("scat8"),
                uiOutput("scat9"),
                uiOutput("scat10"),
                uiOutput("scat11"),
                uiOutput("scat12"),
                tags$head(tags$style("#scat7,#scat8,#scat9,                    
                                     #scat10,#scat11,#scat12{color: black;
                                     font-size: 40px;
                                     font-style: bold;    
                                     text-align: left;}"
                )
                )
                ),
            box(width=12,
                uiOutput("timeleft"),
                tags$head(tags$style("#timeleft{color: #3c8dbc;
                                     font-size: 85px;
                                     font-style: bold;    
                                     text-align: center;
                                     }"
                )
                )
                )
                )
    
    
                )
                )






# Put them together into a dashboardPage
dashboardPage(
  header,
  sidebar,
  body
)