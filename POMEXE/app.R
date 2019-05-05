######################################################################
# Profit Test OffMarket
#
######################################################################


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("PROFIT TESTING APP"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(

      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(tabPanel("Info Policy",
                             numericInput("prod", "Product: ",0,0,100),
                             sliderInput("age","Age:",15,65,30),
                             selectInput("gender", "Gender",c("M","F")),
                             numericInput("premium","Single Premium",0,0,100),
                             selectInput("period", "Period Payment",choices=c("Monthly", "Quarterly","Yearly"))
                             ),
                    tabPanel("Premium"))
               )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

