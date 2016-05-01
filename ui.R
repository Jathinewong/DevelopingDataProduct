
library(shiny)
library(rCharts)

shinyUI(fluidPage(

  titlePanel("Cellphone Subscriptions Prediction by Continent"), 
        
        h5("This application uses Cellphone subscriptions, food consumption and population density from 1990 to 2007 to predict cellphone subscriptions for 2008 to 2020"),

        h6("Cellphone Subscriptions per 100 people"),
        h6("Food Consumpton - unit kilocalories available on average, per person, per day."),
        h6("Population density per square km by continent"),

        h6(strong("The cellphone subscriptions values show on the graph from the year 1990 to 2007 are the actual values from the World Bank.")),

        h6("The predicted food consumption and population density data will be calculated based on the previous year values with the % increase / decrease."),


  sidebarLayout(
    sidebarPanel(
      sliderInput("food_value",
                  "Food Consumption % increase/decrease from the previous year",
                  min = -100,
                  max = 100,
                  value = 0, 
                  step= 5),
      br(),
      
      sliderInput("density_value",
                "Population Density % increase/decrease from the previous year",
                min = -100,
                max = 100,
                value = 0, 
                step= 5),
      br(),
      actionButton('goButton', 'Re-Plot the Graph')
  ),

    mainPanel(
            showOutput("cellplot", "morris")  # morrisjs library
    )
  )
))
