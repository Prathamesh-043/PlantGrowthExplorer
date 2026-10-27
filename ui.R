
library(shiny)

ui <- fluidPage(
  
  titlePanel("Plant Growth Explorer"),
  
  sidebarLayout(
    
    sidebarPanel(
      h4("Explore the PlantGrowth Dataset"),
      
      p("Choose a treatment group to explore plant weight measurements."),
      
      selectInput(
        inputId = "group",
        label = "Select a plant group:",
        choices = c(
          "All Groups" = "all",
          "Control Group" = "ctrl",
          "Treatment Group 1" = "trt1",
          "Treatment Group 2" = "trt2"
        ),
        selected = "all"
      ),
      
      helpText(
        "The dataset contains plant weights measured under three conditions."
      )
    ),
    
    mainPanel(
      h3("Your Results"),
      
      p("Use the dropdown menu to update the results."),
      
      h4("Summary Statistics"),
      verbatimTextOutput("summary"),
      
      h4("Plant Weight Distribution"),
      plotOutput("weightPlot"),
      
      h4("About This Application"),
      p(
        "This application uses R's built-in PlantGrowth dataset ",
        "to explore plant weights across a control group and two ",
        "treatment groups."
      ),
      p(
        "How to use: Select a group from the dropdown menu. ",
        "The summary statistics and chart update automatically. ",
        "Plant weight is recorded in the dataset's original units."
      ),
      p(
        "Note: This application explores the data and does not ",
        "establish that a treatment caused a change in plant growth."
      )
    )
  )
)

