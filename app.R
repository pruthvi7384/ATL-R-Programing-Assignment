# Modified from Winston Chang, 
# https://shiny.rstudio.com/gallery/shiny-theme-selector.html

# Concepts about Reactive programming used by Shiny, 
# https://shiny.rstudio.com/articles/reactivity-overview.html

# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("cerulean"),
    navbarPage(
      # theme = "cerulean",  # <--- To use a theme, uncomment this
      "Welcome App",
      tabPanel("Home",
               sidebarPanel(
                 tags$h3("Enter Your Detailes"),
                 textInput("txt1", "Name:", ""),
                 textInput("txt2", "Surname:", ""),
                 textInput("txt3", "Mobile Number:", ""),
                 textInput("txt4", "Email Id:", ""),
                 textInput("txt5", "Collage Name:", ""),
                 
               ), # sidebarPanel
               mainPanel(
                            h2("Your Entered Detailes Available Below"),
                            
                            h4("Full Name"),
                            verbatimTextOutput("name"),
                            
                            h4("Your Mobile Number"),
                            verbatimTextOutput("mobile"),
                            
                            h4("Your Email Id"),
                            verbatimTextOutput("email"),
                            
                            h4("Your Collage Name"),
                            verbatimTextOutput("collage"),

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("About", "This panel is intentionally left blank"),
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
    output$name <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
    output$mobile <- renderText({
      paste(input$txt3, '' , sep = " ")
    })
    output$email <- renderText({
      paste(input$txt4, '' , sep = " ")
    })
    output$collage <- renderText({
      paste(input$txt5, '' , sep = " ")
    })
  } # server
  

  # Create Shiny object
  shinyApp(ui = ui, server = server)
