Let's log events on the browser side!

The app now has a `www/script.js` file. It contains some JavaScript code that observes changes to all Shiny inputs.

Let's send information about input changes to the server side of the app via `Shiny.setInputValue()` function.

It has 3 arguments:

1. Name of the input value. If we use "foo" in Shiny we can access the value via `input$foo`.
2. Value of the input.
3. 3rd argument is optional. If we put `{ priority: "event" }` there, the value will be sent to the server immediately, even if the value hasn't changed.

Read more in https://shiny.posit.co/r/articles/build/communicating-with-js/

# Task

1. Send a message using `Shiny.setInputValue` with an ID and the value of input that changed.
2. Receive this information in the server by observing the corresponding `input` slot.
3. Save the logs to the file (use `logger` from previous exercise)
