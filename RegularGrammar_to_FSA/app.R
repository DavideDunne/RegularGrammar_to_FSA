# Raúl Antonio Castillejos Santillán A01174919@tec.mx
# Davide Dunne Sanchez A01642355@tec.mx

library(shiny)
library(igraph)
library(shinydashboard)
source("functions.R")

ui <- dashboardPage(
    dashboardHeader(title = "Proyecto 3 "),
    dashboardSidebar(
      menuItem("Convertidor", tabName = "convertidor", icon = icon("bolt")),
      menuItem("Verificador", tabName = "verificador", icon = icon("dashboard"))
    ),
    dashboardBody(
      tabItems(
        # First tab content
        tabItem(tabName = "convertidor",
                box(
                  textAreaInput("text.convert", "Automata a plotear", rows=10),
                  verbatimTextOutput("value.convert"),
                  verbatimTextOutput("convert.class")
                )
                ),
        
        
        # Second tab content
        tabItem(tabName = "verificador",
                box(
                  textAreaInput("text.verify", "Automata a verificar", rows=10),
                  verbatimTextOutput("value.verify"),
                  verbatimTextOutput("verify.class")
                )
                )
      )
      )
  )
    
server <- function(input, output) {
  output$value.convert <- renderText({ input$text.convert })
  output$value.verify <- renderText({ input$text.verify })
  output$convert.class <- renderText({ class(input$text.convert) })
  output$verify.class <- renderText({ class(input$text.verify) }) 
  
}
shinyApp(ui, server)


# Run the application 
shinyApp(ui = ui, server = server)
