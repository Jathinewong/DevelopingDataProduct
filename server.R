
# The following data sets were prepared in prep_data.R
# Mobile phone 
# Food consumption 
# Population density per square km
# countries by continents 
# 
# Only used data from 1990 to 2007 for this project

library(shiny)
library(rCharts)

cell.trans <- read.csv("data/cell_continent.csv", head=TRUE, fill=TRUE)
cell.trans$Year <- as.character(cell.trans$Year)

source("predict_cell.R")

shinyServer(function(input, output) {

        # generate plot based on input$country, input$year, and input$tab from ui.R
        ##bPlot <- gvisBubbleChart(data=year.df, 
        ##                         idvar="country", 
#                                  xvar=year.x(), 
#                                  yvar=year.y(), 
#                                  sizevar = year.bubble(),
#                                  colorvar="Continent", 
#                                  chartid = "bubblePlot") 
#         output$bubblePlot <- renderChart({
#                                 plot(bPlot)
#        })
        
        
        output$cellplot <- renderChart({
                if (input$goButton == 0)
                        df <- cell.trans
                else if ( input$goButton > 0 ) {
                        isolate(df <- predict_cell(cell.trans, input$food_value, input$density_value))
                }
                
                cell.plot <- mPlot(x="Year", y = colnames(df)[2:ncol(df)], data=df, type='Line')
                cell.plot$set(pointSize=0)
                cell.plot$set(hidHover="auto")
                ##cell.plot$show()
                cell.plot$addParams(dom="cellplot")
                return(cell.plot)
        })

})
