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
library(beepr)
library(shinyBS)

#this is the public URL to the google sheet containing scattergories cats I compiled:
scatsheet <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vTFGp5QRh27VjX-WlxMhK_rxVEVfW-FAKBjKqyeR44dzfjfGCFt3L3Jed9uKhCZN1FC9gYZKRmL39ss/pub?output=xlsx"

#load in data
tmp = tempfile(fileext = ".xlsx")
download.file(url = scatsheet, destfile = tmp, mode="wb")
dat <- readWorksheetFromFile(file = tmp, 1)

#not in function operator
'%!in%' <- function(x,y)!('%in%'(x,y))

#scategory column isolated
scats <- dat[1]

#random letter generator
get_letter <- function(){
  return(sample(LETTERS, 1, replace = T))
}

#capitalize first letter function
firstup <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}

#apply this to the data
dat$cat <- firstup(dat$cat)






###--------------------------------START ACTUAL SERVER--------------------------###

shinyServer(function(input,output,session){
  
  my_letter <- reactive({
    
    if(input$newletter==0){  
      return()
    }  
    isolate({   
      get_letter()
    })
    
  })
  
  
first_dat <- reactive({
  
    filt_dat <- dat %>%
      filter(cat %in% input$customcats &
               difficulty %in% input$diff_sel) %>%
      select(scat)
    return(filt_dat)
  
})
  
scatties <- reactive({
  
  dat <<- first_dat()
  
  if(input$start==0){
    return()
  }
  
  if(input$start==1){
    the_scats_r1 <<- sample(dat$scat, 12, replace=F)
    return(the_scats_r1)
  }
  
  if(input$start==2){
    dat_r2 <<- dat %>%
      filter(scat %!in% the_scats_r1)
    
    validate(
      need(nrow(dat_r2) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r2 <<- sample(dat_r2$scat, 12, replace=F)
    return(the_scats_r2)
  }
  
  if(input$start==3){
    dat_r3 <<- dat_r2 %>%
      filter(scat %!in% the_scats_r2)
    
    validate(
      need(nrow(dat_r3) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r3 <<- sample(dat_r3$scat, 12, replace=F)
    return(the_scats_r3)
  }
  
  if(input$start==4){
    dat_r4 <<- dat_r3 %>%
      filter(scat %!in% the_scats_r3)
    
    validate(
      need(nrow(dat_r4) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r4 <<- sample(dat_r4$scat, 12, replace=F)
    return(the_scats_r4)
  }
  
  if(input$start==5){
    dat_r5 <<- dat_r4 %>%
      filter(scat %!in% the_scats_r4)
    
    validate(
      need(nrow(dat_r5) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r5 <<- sample(dat_r5$scat, 12, replace=F)
    return(the_scats_r5)
  }
  
  if(input$start==6){
    dat_r6 <<- dat_r5 %>%
      filter(scat %!in% the_scats_r5)
    
    validate(
      need(nrow(dat_r6) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r6 <<- sample(dat_r6$scat, 12, replace=F)
    return(the_scats_r6)
  }
  
  if(input$start==7){
    dat_r7 <<- dat_r6 %>%
      filter(scat %!in% the_scats_r6)
    
    validate(
      need(nrow(dat_r7) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r7 <<- sample(dat_r7$scat, 12, replace=F)
    return(the_scats_r7)
  }
  
  if(input$start==8){
    dat_r8 <<- dat_r7 %>%
      filter(scat %!in% the_scats_r7)
    
    validate(
      need(nrow(dat_r8) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r8 <<- sample(dat_r8$scat, 12, replace=F)
    return(the_scats_r8)
  }
  
  if(input$start==9){
    dat_r9 <<- dat_r8 %>%
      filter(scat %!in% the_scats_r8)
    
    validate(
      need(nrow(dat_r9) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r9 <<- sample(dat_r9$scat, 12, replace=F)
    return(the_scats_r9)
  }
  
  if(input$start==10){
    dat_r10 <<- dat_r9 %>%
      filter(scat %!in% the_scats_r9)
    
    validate(
      need(nrow(dat_r10) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r10 <<- sample(dat_r10$scat, 12, replace=F)
    return(the_scats_r10)
  }
  
  if(input$start==11){
    dat_r11 <<- dat_r10 %>%
      filter(scat %!in% the_scats_r10)
    
    validate(
      need(nrow(dat_r11) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r11 <<- sample(dat_r11$scat, 12, replace=F)
    return(the_scats_r11)
  }
  
  if(input$start==12){
    dat_r12 <<- dat_r11 %>%
      filter(scat %!in% the_scats_r11)
    
    validate(
      need(nrow(dat_r12) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r12 <<- sample(dat_r12$scat, 12, replace=F)
    return(the_scats_r12)
  }
  
  if(input$start==13){
    dat_r13 <<- dat_r12 %>%
      filter(scat %!in% the_scats_r12)
    
    validate(
      need(nrow(dat_r13) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r13 <<- sample(dat_r13$scat, 12, replace=F)
    return(the_scats_r13)
  }
  
  if(input$start==14){
    dat_r14 <<- dat_r13 %>%
      filter(scat %!in% the_scats_r13)
    
    validate(
      need(nrow(dat_r14) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r14 <<- sample(dat_r14$scat, 12, replace=F)
    return(the_scats_r14)
  }
  
  if(input$start==15){
    dat_r15 <<- dat_r14 %>%
      filter(scat %!in% the_scats_r14)
    
    validate(
      need(nrow(dat_r15) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r15 <<- sample(dat_r15$scat, 12, replace=F)
    return(the_scats_r15)
  }
  
  if(input$start==16){
    dat_r16 <<- dat_r15 %>%
      filter(scat %!in% the_scats_r15)
    
    validate(
      need(nrow(dat_r16) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r16 <<- sample(dat_r16$scat, 12, replace=F)
    return(the_scats_r16)
  }
  
  if(input$start==17){
    dat_r17 <<- dat_r16 %>%
      filter(scat %!in% the_scats_r16)
    
    validate(
      need(nrow(dat_r17) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r17 <<- sample(dat_r17$scat, 12, replace=F)
    return(the_scats_r17)
  }
  
  if(input$start==18){
    dat_r18 <<- dat_r17 %>%
      filter(scat %!in% the_scats_r17)
    
    validate(
      need(nrow(dat_r18) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r18 <<- sample(dat_r18$scat, 12, replace=F)
    return(the_scats_r18)
  }
  
  if(input$start==19){
    dat_r19 <<- dat_r18 %>%
      filter(scat %!in% the_scats_r18)
    
    validate(
      need(nrow(dat_r19) >= 12, "Not enough scattegories left to sample from.
           Please choose more categories from the 'Game Options' tab.")
      )
    
    the_scats_r19 <<- sample(dat_r19$scat, 12, replace=F)
    return(the_scats_r19)
  }
  
  if(input$start==20){
    dat_r20 <<- dat_r19 %>%
      filter(scat %!in% the_scats_r19)
    
    validate(
      need(nrow(dat_r20) >= 12, "Not enough scattegories left to sample from.
         Please choose more categories from the 'Game Options' tab.")
    )
    
    the_scats_r20 <<- sample(dat_r20$scat, 12, replace=F)
    return(the_scats_r20)
  }
  
  isolate({
    all_done <- rep("Game Over!", 12)
    return(all_done)
  })
  
  
})
  
  
  
  
  
  
  

scat1 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("1.", scatties()[1])
    
  })
  
})

scat2 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("2.", scatties()[2])
    
  })
  
})

scat3 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("3.", scatties()[3])
    
  })
  
})

scat4 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("4.", scatties()[4])
    
  })
  
})

scat5 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("5.", scatties()[5])
    
  })
  
})

scat6 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("6.", scatties()[6])
    
  })
  
})

scat7 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("7.", scatties()[7])
    
  })
  
})

scat8 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("8.", scatties()[8])
    
  })
  
})

scat9 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("9.", scatties()[9])
    
  })
  
})

scat10 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("10.", scatties()[10])
    
  })
  
})

scat11 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("11.", scatties()[11])
    
  })
  
})

scat12 <- reactive({
  
  if(input$start==0){  
    return()
  }  
  isolate({   
    paste("12.", scatties()[12])
    
  })
  
})




output$start_timer <- renderUI({
  actionButton(
    inputId = "start",
    label="Start Timer",
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
        beep(3)
      }
    }
  })
})

# observers for actionbuttons
observeEvent(input$start, {active(TRUE)})
observeEvent(input$reset, {timer(input$customtime)})

output$newletter <- renderUI({
  actionButton(
    inputId = "newletter",
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
    label="Reset",
    width = "100%"
  )
})


output$letter <- renderText({ 
  my_letter()
})



####Optional Game Settings#####

output$time_selector <- renderUI({
  sliderInput(
    inputId = "customtime",
    label = "Select Time Limit (in seconds)",
    value = 150,
    min = 30,
    max = 210,
    step = 5
  )
})

output$difficulty_selector <- renderUI({
 pickerInput(
    inputId = "diff_sel",
    label = "Select Difficulty of Scattegories",
    choices = unique(dat$difficulty),
    selected = unique(dat$difficulty),
    options = list(
      `actions-box` = T, 
      size = 2
    ), 
    multiple = T
  )
})

output$category_selector <- renderUI({
  pickerInput(
    inputId = "customcats", 
    label = "Select which categories to choose from", 
    choices = unique(dat$cat),
    selected = unique(dat$cat),
    options = list(
      `actions-box` = T, 
      size = 10
    ), 
    multiple = T
  )
})








})