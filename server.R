
library(shiny)

server <- function(input, output) {
  
  # Load the built-in plant growth dataset
  data <- PlantGrowth
  
  # Filter the dataset based on the user's selection
  selectedData <- reactive({
    
    if (input$group == "all") {
      data
    } else {
      data[data$group == input$group, ]
    }
    
  })
  
  # Calculate summary statistics for the selected group
  output$summary <- renderPrint({
    
    currentData <- selectedData()
    
    cat("Selected group:", input$group, "\n\n")
    cat("Number of plants:", nrow(currentData), "\n")
    cat("Average plant weight:", round(mean(currentData$weight), 2), "\n")
    cat("Median plant weight:", round(median(currentData$weight), 2), "\n")
    cat("Minimum plant weight:", min(currentData$weight), "\n")
    cat("Maximum plant weight:", max(currentData$weight), "\n")
    
  })
  
  # Create a chart of plant weight measurements
  output$weightPlot <- renderPlot({
    
    currentData <- selectedData()
    
    hist(
      currentData$weight,
      main = "Distribution of Plant Weights",
      xlab = "Plant Weight",
      ylab = "Number of Plants",
      col = "lightblue",
      border = "white"
    )
    
  })
  
}
