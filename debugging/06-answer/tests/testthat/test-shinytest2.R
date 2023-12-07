library(shinytest2)

test_that("{shinytest2} recording: 05-answer", {
  app <- AppDriver$new(name = "05-answer", height = 970, width = 979)
  app$set_inputs(`adjust_data_ui-x-select` = "feed")
  app$set_inputs(`adjust_data_ui-y-select` = "feed")
  app$expect_values()
})
