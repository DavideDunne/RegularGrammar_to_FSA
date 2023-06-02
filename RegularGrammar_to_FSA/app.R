# Raúl Antonio Castillejos Santillán A01174919@tec.mx
# Davide Dunne Sanchez A01642355@tec.mx

source("functions.R")
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
                  textAreaInput("text.convert", "Automata a plotear", rows=10, value = "S->aB\nS->bA\nB->bA\nB->cA\nB->a"),
                  verbatimTextOutput("value.convert"),
                  verbatimTextOutput("convert.class"),
                  plotOutput("RegGram.plot")
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
  
  output$RegGram.plot <- renderPlot({
    tran <- strsplit(input$text.convert, "\n")[[1]]
    l <- length(tran)
    
    #At least one Regular Grammar statement
    if(l>0){
      graph.data <- build.nodes(tran)
      g <- graph(graph.data$nodes, directed = TRUE)
      layout <- layout_with_fr(g)
      mapping.colors <- c("white","green","red")
      node.colors <- mapping.colors[graph.data$type.node]
      set.seed(42)
      curves <- curve_multiple(g)
      # Plot DFA graph
      plot(g,
           edge.label = graph.data$edges,
           vertex.color = node.colors,
           vertex.frame.color = "black",
           vertex.label.color = "black",
           edge.arrow.size = .5,
           edge.curved = curves,
           layout = layout
      )
    } else {
      g.e <- make_empty_graph()
      plot(g.e)
    }
  })
}

shinyApp(ui, server)


# Run the application 
shinyApp(ui = ui, server = server)
