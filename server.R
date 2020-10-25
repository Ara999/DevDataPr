library(shiny)
library(datasets)

Cardata <- mtcars
Cardata$am <- factor(Cardata$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(data=Cardata, as.formula(formulaTextPoint()))
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$carBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = Cardata,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$carPlot <- renderPlot({
        with(Cardata, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    })
    
})