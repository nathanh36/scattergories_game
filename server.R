###---------------------------------------GLOBAL---------------------------------------###

#load libs
library(shiny)
library(ggplot2)
library(plotly)
library(stringr)
library(scales)
library(grid)
library(rvest)
library(lubridate)
library(shinyWidgets)
library(DT)
library(dplyr)
library(XLConnect)
library(english)

#this is the public URL to the google sheet containing scattergories cats I compiled:
scatsheet <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTFGp5QRh27VjX-WlxMhK_rxVEVfW-FAKBjKqyeR44dzfjfGCFt3L3Jed9uKhCZN1FC9gYZKRmL39ss/pub?output=xlsx"

#load in data
tmp = tempfile(fileext = ".xlsx")
download.file(url = scatsheet, destfile = tmp, mode="wb")
dat <- readWorksheetFromFile(file = tmp, 1)

#not in function operator
'%!in%' <- function(x,y)!('%in%'(x,y))

#random letter generator
get_letter <- function(){
  return(sample(LETTERS, 1, replace = T))
}

#scategory column isolated
scats <- dat[1]

scats$round <- as.character(sample(rep(as.english(1:20), 12)))

round_list <- split(scats$scat, scats$round)

list2env(round_list, globalenv())

#get random 12 scats for the game
get_scats <- function(){
  return(as.data.frame(sample(round_list, 1, replace=F)))
}

new_scats <- scats %>%
  filter(scat %!in% as.character(get_scats()[,1]))


scatdats <- list(NULL)
get_scats2 <- function(rl){
  
  the_round <- sample(rl, 1)
  
  return(the_round)
  
}




###--------------------------------START ACTUAL SERVER--------------------------###

shinyServer(function(input,output,session){
  
  my_letter <- reactive({
    
    if(input$submit==0){  
      return()
    }  
    isolate({   
      get_letter()
    })
    
  })
  
  my_scats <- reactive({
    
    if(input$submit==0){  
      return()
    }  
    isolate({
      
      num <<- sample(names(get_scats2(round_list)), 1)
      
      round_list[which(names(round_list) == num)] <<- NULL
      
      rl <<- round_list
      
      get_scats2(rl)
      
    })
    
  })
  
  scat1 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("1.", get(names(my_scats()))[1])
      
    })
    
  })
  
  scat2 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("2.", get(names(my_scats()))[2])
      
    })
    
  })
  
  scat3 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("3.", get(names(my_scats()))[3])
      
    })
    
  })
  
  scat4 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("4.", get(names(my_scats()))[4])
      
    })
    
  })
  
  scat5 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("5.", get(names(my_scats()))[5])
      
    })
    
  })
  
  scat6 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("6.", get(names(my_scats()))[6])
      
    })
    
  })
  
  scat7 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("7.", get(names(my_scats()))[7])
      
    })
    
  })
  
  scat8 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("8.", get(names(my_scats()))[8])
      
    })
    
  })
  
  scat9 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("9.", get(names(my_scats()))[9])
      
    })
    
  })
  
  scat10 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("10.", get(names(my_scats()))[10])
      
    })
    
  })
  
  scat11 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("11.", get(names(my_scats()))[11])
      
    })
    
  })
  
  scat12 <- reactive({
    
    if(input$start==0){  
      return()
    }  
    isolate({   
      paste("12.", get(names(my_scats()))[12])
      
    })
    
  })
  
  
  output$letter <- renderText({ 
      my_letter()
    })
  
  output$scats <- DT::renderDataTable(
    DT::datatable(my_scats(),
                  rownames= T,
                  colnames = c("Category"),
                  options = list(scrollX = F, dom = 'Bfrtip',  pageLength = 12)
    )
  )
    
  output$submit <- renderUI({
      actionButton(
        inputId = "submit",
        label="New Letter",
        width = "65%"
      )
    })
  
  output$start_timer <- renderUI({
    actionButton(
      inputId = "start",
      label="Start Timer",
      width = "100%"
    )
  })
  
  output$reset_timer <- renderUI({
    actionButton(
      inputId = "reset",
      label="Reset Timer",
      width = "100%"
    )
  })
  
  output$scat1 <- renderText({
    scat1()
  })
  
  output$scat2 <- renderText({
    scat2()
  })
  
  output$scat3 <- renderText({
    scat3()
  })
  
  output$scat4 <- renderText({
    scat4()
  })
  
  output$scat5 <- renderText({
    scat5()
  })
  
  output$scat6 <- renderText({
    scat6()
  })
  
  output$scat7 <- renderText({
    scat7()
  })
  
  output$scat8 <- renderText({
    scat8()
  })
  
  output$scat9 <- renderText({
    scat9()
  })
  
  output$scat10 <- renderText({
    scat10()
  })
  
  output$scat11 <- renderText({
    scat11()
  })
  
  output$scat12 <- renderText({
    scat12()
  })
  
  
  
  
  
  
  
  
  
  # Initialize the timer, 10 seconds, not active.
  timer <- reactiveVal(150)
  active <- reactiveVal(FALSE)
  
  # Output the time left.
  output$timeleft <- renderText({
    paste(timer())
  })
  
  # observer that invalidates every second. If timer is active, decrease by one.
  observe({
    invalidateLater(1000, session)
    isolate({
      if(active())
      {
        timer(timer()-1)
        if(timer()<1)
        {
          active(FALSE)
          showModal(modalDialog(
            title = "STOP WRITING!",
            "The round is over!"
          ))
        }
      }
    })
  })
  
  # observers for actionbuttons
  observeEvent(input$start, {active(TRUE)})
  observeEvent(input$reset, {timer(150)})
  
  
  
  #LOOK INTO REACTIVITY/OBSERVE EVENTS CAPABILITIES FOR MULTIPLE CONDITIONS,
  #I.E. 2 ACTION BUTTONS HAVE BOTH BEEN PRESSED, ONE AND NOT THE OTHER, ETC.
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # Importing data and save it temporary in data variable
  # data <- reactive({
  #   findat2
  # })
  
  
  # #setwd("/S3/FILES_MT_S3/")
  # outputDir <- "D:/UserData/z0040k8p/Documents/R"
  # 
  # saveData <- function(data) {
  #   data <- t(data)
  #   # Create a unique file name
  #   fileName <- sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(data))
  #   # Write the file to the local system
  #   write.csv(
  #     x = data,
  #     file = file.path(outputDir, fileName),
  #     row.names = FALSE, quote = TRUE
  #   )
  # }
  # 
  # loadData <- function() {
  #   # Read all the files into a list
  #   files <- list.files(outputDir, full.names = TRUE)
  #   data <- lapply(files, read.csv, stringsAsFactors = FALSE)
  #   # Concatenate all data together into one data.frame
  #   data <- do.call(rbind, data)
  #   data
  # }
  # 
  # 
  # 
  # 
  # # Whenever a field is filled, aggregate all form data
  # formData <- reactive({
  #   data <- sapply(fields, function(x) input[[x]])
  #   data
  # })
  # 
  # # When the Submit button is clicked, save the form data
  # observeEvent(input$submit, {
  #   saveData(formData())
  # })
  # 
  # # Show the previous responses
  # # (update with current response when Submit is clicked)
  # output$responses <- DT::renderDataTable({
  #   input$submit
  #   loadData()
  # })
  # 
  # # Define the fields we want to save from the form
  # #fields <- c("name", "used_shiny", "r_num_years")
  # 
  # 
  # output$responses <- DT::renderDataTable({
  #   input$submit
  #   loadData()
  # })
  # 
  # output$name <- renderUI({
  #   textInput(
  #     inputId = "name",
  #     label="Name",
  #     value=""
  #   )
  # })
  # 
  # output$used_shiny <- renderUI({
  #   checkboxInput(
  #     inputId = "used_shiny",
  #     label="I've built a shiny app before",
  #     value=F
  #   )
  # })
  # 
  # output$r_num_years <- renderUI({
  #   sliderInput(
  #     inputId = "r_num_years",
  #     label="Number of years using R",
  #     min=0,
  #     max=25,
  #     value=2,
  #     ticks=F
  #   )
  # })
  # 
  # output$submit <- renderUI({
  #   actionButton(
  #     inputId = "submit",
  #     label="Submit"
  #   )
  # })
  
  
  
  #install.packages('C:/Users/z0040k8p/Downloads/RDCOMClient_0.93-0.zip', repos = NULL, type = "win.binary")
  
  
  #system('/opt/message-send email nathan.hall@siemens-healthineers.com,gary.molino@siemens-healthineers.com "testing server email" "test test test. did you get me?"')
  
  
})