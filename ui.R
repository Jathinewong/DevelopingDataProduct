
library(shiny)
library(rCharts)

shinyUI(fluidPage(

  titlePanel("Cellphone Subscriptions Prediction by Continent"), 
        
        h5("This application uses Cellphone subscriptions, food consumption and population density values from 1990 to 2007"),
        h5("to predict cellphone subscriptions for the year 2008 to 2020."),
        br(),
        h6("Cellphone Subscriptions per 100 people"),
        h6("Food Consumpton - unit kilocalories available on average, per person, per day."),
        h6("Population density per square km by continent"),
        br(),
        h6(strong("The cellphone subscriptions values show on the graph from the year 1990 to 2007 are the actual values from the World Bank.")),
        br(),
        h6("The predicted food consumption and population density data will be calculated by changing the % increase / decrease values, "),
        h6("and will be apply to the previous year values of each of the continent"),


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
