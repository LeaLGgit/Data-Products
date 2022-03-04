#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data(diamonds)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   # Show Plot
    output$distPlot <- renderPlot({
  
      subset <- diamonds %>% filter(carat > input$Carat[1] & carat < input$Carat[2],
                                         cut == input$Cut)

       ggplot(subset) +
         aes( x = carat, y= price) +
         geom_point() +
         labs(x = "carat", y ="Prices in US Dollars")+
         ylim(min(diamonds$price), max(diamonds$price)) +
         xlim (0, 5)
        })
})
