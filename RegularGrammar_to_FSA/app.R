# Raúl Antonio Castillejos Santillán A01174919@tec.mx
# Davide Dunne Sanchez A01642355@tec.mx

library(shiny)
library(igraph)
library(shinydashboard)

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
                  textAreaInput("text", "Automata a plotear", rows=10),
                  verbatimTextOutput("value")
                )
                ),
        
        
        # Second tab content
        tabItem(tabName = "verificador",
                box(
                  textAreaInput("text", "Automata a verificar", rows=10),
                  verbatimTextOutput("value")
                )
                )
      )
      )
  )
    
server <- function(input, output) {
  output$value <- renderText({ input$text })
  
}
shinyApp(ui, server)


# Run the application 
shinyApp(ui = ui, server = server)
