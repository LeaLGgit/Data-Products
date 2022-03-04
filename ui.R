#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)


data(diamonds)


# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Values of diamonds"),

    # Sidebar with a slider input and drop down options
    sidebarLayout(
        sidebarPanel(
             h6("Explore prices of diamonds.") ,
        
            selectInput("Cut",
                        label = strong("Select kind of cut"),
                        choices = unique(diamonds$cut)
                        ),

            sliderInput("Carat",
                        label = strong("Select carat"),
                        min = 0 , max = 5, sep="",
                        value = c(2, 4)
                        )
            
          ),

        # Show a plot of the generated distribution and some text
        mainPanel(
            h2("Features of diamonds set the prices."),
            h6("Play around with the kind of cut and carat to see different price effects and perhaps an interplay between both. Do you think another feature might play an important role?"),
            plotOutput("distPlot"),
            h6("Data is retrieved from diamonds dataset in R.")
            
        )
    )
))
