library(bslib)
library(dplyr)
library(ggplot2)
library(logger)
library(shiny)
library(shinyjs)

dataset_select_ui <- function(id) {
  ns <- NS(id)
  selectInput(
    ns("select"),
    label = "Select Dataset",
    choices = c("chickwts", "iris", "CO2", "cars")
  )
}

dataset_select_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    dataset <- reactive({
      switch(
        input$select,
        "chickwts" = chickwts,
        "iris" = iris,
        "CO2" = CO2,
        "cars" = cars
      )
    })

    return(dataset)
  })
}

variable_select_ui <- function(id, label = "Select Column") {
  ns <- NS(id)
  selectInput(ns("select"), label, choices = NULL)
}

variable_select_server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    observe({
      choices <- colnames(data())
      log_info("Updating variable select with choices: {paste0(choices, collapse = ', ')}")
      updateSelectInput(
        session,
        "select",
        choices = choices,
        selected = choices[1]
      )
    })

    return(reactive(input$select))
  })
}

filter_variable_ui <- function(id) {
  ns <- NS(id)
  sliderInput(
    ns("filter_slider"),
    label = "Filter",
    min = 0,
    max = 1,
    value = c(0, 1),
    step = 0.1
  )
}

filter_variable_server <- function(id, data, variable) {
  moduleServer(id, function(input, output, session) {
    observe({
      req(data(), variable())
      if (is.numeric(data()[[variable()]])) {
        log_info("Updating filter slider for variable = '{variable()}'")
        show("filter_slider")
        updateSliderInput(
          session,
          "filter_slider",
          min = min(data()[[variable()]]),
          max = max(data()[[variable()]]),
          value = range(data()[[variable()]])
        )
      } else {
        hide("filter_slider")
      }
    })

    return(reactive(input$filter_slider))
  })
}

adjust_data_ui <- function(id) {
  ns <- NS(id)
  tagList(
    variable_select_ui(ns("x"), label = "Select X"),
    filter_variable_ui(ns("x_filter")),
    variable_select_ui(ns("y"), label = "Select Y"),
    filter_variable_ui(ns("y_filter"))
  )
}

adjust_data_server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    x <- variable_select_server("x", data)
    y <- variable_select_server("y", data)
    filter_x <- filter_variable_server("x_filter", data, x)
    filter_y <- filter_variable_server("y_filter", data, y)

    data_adjusted <- reactive({
      req(data(), x(), y())
      log_info("Selecting variables: x = '{x()}', y = '{y()}'")
      data <- data() |>
        select(x = x(), y = y())
      if (is.numeric(data$x)) {
        log_info("Filtering X variable with: [{filter_x()[1]}, {filter_x()[2]}]")
        data <- data |>
          filter(x < filter_x()[2], x > filter_x()[1])
      }
      if (is.numeric(data$y)) {
        log_info("Filtering Y variable with: [{filter_y()[1]}, {filter_y()[2]}]")
        data <- data |>
          filter(y < filter_y()[2], y > filter_y()[1])
      }
      data
    })

    return(data_adjusted)
  })
}

boxplot_ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("plot"))
}

boxplot_server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderPlot({
      req(data())
      log_info("Rendering boxplot")
      ggplot(data(), aes(x = x, y = y)) +
        geom_boxplot()
    })
  })
}

barplot_ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("plot"))
}

barplot_server <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderPlot({
      req(data())
      log_info("Rendering barplot")
      ggplot(data(), aes(x = x)) +
        geom_bar() +
        labs(y = "Count")
    })
  })
}

ui <- page_fillable(
  useShinyjs(),
  layout_sidebar(
    div(
      id = "plots",
      class = "d-flex flex-row h-100",
      boxplot_ui("plot1_ui"),
      barplot_ui("plot2_ui")
    ),
    sidebar = sidebar(
      dataset_select_ui("dataset_dropdown_ui"),
      adjust_data_ui("adjust_data_ui")
    )
  )
)

server <- function(input, output, session) {
  data <- dataset_select_server("dataset_dropdown_ui")
  data_adjusted <- adjust_data_server("adjust_data_ui", data)
  boxplot_server("plot1_ui", data_adjusted)
  barplot_server("plot2_ui", data_adjusted)
}

shinyApp(ui, server)
