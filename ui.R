
library(shiny)

# Define UI for application that draws a histogram
shinyUI(
    navbarPage("Developing Data Products - Shiny Application for mtcars Dataset",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("MPG and Variables relationship"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Cylinders" = "cyl",
                                                  "Horsepower" = "hp",
                                                  "Carburetors" = "carb",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "Transmission" = "am",
                                                  "Gears" = "gear"
                                                )),
                                    
                                    checkboxInput("outliers", "Show outliers (for boxplot)", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs",
                                                tabPanel("Regression model", 
                                                         plotOutput("carPlot"),
                                                         verbatimTextOutput("fit")),
                                                tabPanel("BoxPlot", plotOutput("carBoxPlot")
                                                )
                                    )
                                )
                            )
                        )
               ), 
               tabPanel("Link for code: Github repository",
                        a("https://github.com/Ara999/DevDataPr"),
                        hr(),
                        )))
