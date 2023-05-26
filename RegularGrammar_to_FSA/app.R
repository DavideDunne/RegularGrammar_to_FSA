#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(igraph)
library(shinydashboard)





ui <- dashboardPage(
    dashboardHeader(title = "Proyecto 3 "),
    dashboardSidebar(
      menuItem("Convertidor de grámatica", tabName = "convertidor", icon = icon("th")),
      menuItem("Verificador de automata finito determinista", tabName = "verificador", icon = icon("th"))
    ),
    dashboardBody(
      tabItems(
        # First tab content
        tabItem(tabName = "convertidor",
                box(
                  textInput("Texto", "Automata a plotear", ""),
                  verbatimTextOutput("value")
                )
                ),
        
        
        # Second tab content
        tabItem(tabName = "verificador",
                box(
                  textInput("Texto", "Automata a verificar", ""),
                  verbatimTextOutput("value")
                )
                )
      )
      )
  )
    
server <- function(input, output) {
  output$value <- renderText({ input$Texto })
  
}
shinyApp(ui, server)


# Run the application 
shinyApp(ui = ui, server = server)
