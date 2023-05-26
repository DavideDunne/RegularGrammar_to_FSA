#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
if (interactive()) {
  
  ui <- fluidPage(
    textInput("Texto", "Automata", ""),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    output$value <- renderText({ input$Texto })
  }
  shinyApp(ui, server)
}

# Run the application 
shinyApp(ui = ui, server = server)
