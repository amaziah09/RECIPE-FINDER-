# Load required libraries
library(shiny)
library(tidyverse)
library(dplyr)
library(stringr)

# Load recipe data
load("recipe_data.rda")

# Define UI for the application
ui <- fluidPage(
  titlePanel("Recipe Finder"),

  # Input
  sidebarLayout(
    sidebarPanel(
      # Text input for user to type in ingredients
      textInput("ingredients", "Enter Ingredients (separated by comma)", value = ""),
      actionButton("find", "Find Recipe")
    ),
    mainPanel(
      # Table output to display recipes
      tableOutput("recipe_table")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Create reactive expression to filter recipes
  filtered_data <- reactive({
    # Check if the action button has been clicked
    if (input$find > 0) {
      # Split the input string into individual ingredients
      ingredients <- strsplit(input$ingredients,split = ",")[[1]]

      # Filter the recipe data to only show recipes with at least one of the ingredients
      if (length(ingredients) > 0) {
        recipe_data %>%
          filter(str_detect(ingredient, paste0(ingredients, collapse = "|")))
      } else {
        recipe_data
      }
    }
  })

  # Create table output
  output$recipe_table <- renderTable(
    {
      # Check if the input$ingredients value is not empty and the filtered_data is not an empty reactive expression
      if (!is.null(input$ingredients) && input$ingredients != "" && !identical(filtered_data(), reactive({NULL}))) {
        # Display the first 10 rows of the filtered recipe data
        head(filtered_data(), n = 10)
      } else {
        # Display an empty table when input is empty or there is no match
        data.frame(ingredient = character(), recipe = character(), qty = numeric(), unit = character())
      }
    }
  )
}

# Run the application
shinyApp(ui = ui, server = server)
