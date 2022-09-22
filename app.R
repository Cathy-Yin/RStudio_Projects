library(bslib)
library(shiny)
library(tidyverse)

openipf = read_csv("data/openipf-2021-12-16-033bc48e-subset.csv")

lifts = c(
    "Best Squat" = "Best3SquatKg", 
    "Best Bench" = "Best3BenchKg", 
    "Best Deadlift" = "Best3DeadliftKg", 
    "Total" = "TotalKg")

ui = navbarPage(
  theme = bs_theme(bootswatch = "cerulean", primary = "darkgreen"),
  title = "OPEN IPF",
  tabPanel(
    title = "App",
    titlePanel("Open Ipf Data"),
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "division", label = "Division:", choices = unique(openipf$Division)),
        selectInput(inputId = "age", label = "Age Class:", choices = sort(unique(openipf$AgeClass))),
        selectInput(inputId = "lift", label = "Lift:", choices = lifts),
        checkboxInput(inputId = "pounds", label = "Pounds?"),
      ),
      mainPanel(plotOutput("plot"))
      )
    ),
  tabPanel(title = "Table", dataTableOutput("table")),
  tabPanel(title = "About", includeMarkdown("about.Rmd"))
)

server = function(input, output) {
    
    openipf_div = reactive({
        openipf %>%
            filter(Division == input$division) %>%
            select(-Division, -Event, -Equipment, -WeightClassKg, -BirthYearClass)
    })
  
    observeEvent(eventExpr = input$division, handlerExpr = {
        updateSelectInput(inputId = "age", choices = sort(unique(openipf_div()$AgeClass)))
    })
    
    openipf_div_age = reactive({
      
      openipf_div_age = openipf_div() %>%
            filter(AgeClass == input$age)
      
      if(input$pounds) {
        openipf_div_age = openipf_div_age %>%
          mutate(across(BodyweightKg:TotalKg, kg_to_lbs))
      }
      openipf_div_age
       
    })
    
  output$table = renderDataTable(openipf_div_age())
  output$plot = renderPlot({
    ggplot(openipf_div_age(), aes(x = !!as.symbol(input$lift), y = TotalKg)) +
          geom_point() +
          theme_bw()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
