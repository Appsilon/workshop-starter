library(shiny)
library(bslib)
library(ggplot2)
library(datasets)
library(logger)

log_appender(appender_file("log"))

ui <- page_fluid(
  tags$script(src = "script.js"),
  titlePanel("Iris Dataset Visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x_axis", "X-Axis:", choices = colnames(iris)),
      selectInput("y_axis", "Y-Axis:", choices = colnames(iris)),
      radioButtons("plot_type", "Plot Type:", choices = c("Scatterplot", "Boxplot")),
      sliderInput("point_size", "Point Size:", min = 1, max = 5, value = 3)
    ),
    mainPanel(
      plotOutput("iris_plot")
    )
  )
)

server <- function(input, output) {
  log_info("Session started")
  onStop(\() log_info("Session ended"))

  # Observe the input and log the values with `logger::log_info`

  output$iris_plot <- renderPlot({
    x_axis <- input$x_axis
    y_axis <- input$y_axis
    if (input$plot_type == "Scatterplot") {
      ggplot(iris, aes_string(x = x_axis, y = y_axis, color = "Species")) +
        geom_point(size = input$point_size) +
        labs(x = x_axis, y = y_axis, title = "Scatterplot of Iris Dataset")
    } else if (input$plot_type == "Boxplot") {
      ggplot(iris, aes_string(x = "Species", y = y_axis, fill = "Species")) +
        geom_boxplot() +
        labs(x = "Species", y = y_axis, title = "Boxplot of Iris Dataset")
    }
  })
}

shinyApp(
  ui = ui,
  server = server,
  onStart = \() {
    log_info("App started")
    onStop(\() log_info("App stopped"))
  }
)
