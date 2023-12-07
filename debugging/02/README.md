# Task 2

The app doesn't show any obvious signs of not working properly.

Inspection of the console indicates that there are errors when app starts.

Add logs in reactive code blocks that will explain what happens when the app starts.

Make logs direct you to a place in the code where the error occurs.

Use `logger::log_info`.

If a module has `input$x`, we can format logs with `glue` syntax to look up input values:

```r
logger::log_info("Input x = {input$x}")
```
