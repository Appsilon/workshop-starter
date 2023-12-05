This is an app that visualizes the `iris` dataset.

We want to learn how users interact with the app and what are the most popular features.

In order to do that we will start from logging user actions in the server side of the app.

Let's add `logger::log_info()` calls to collect information what inputs were used.

By default logs are printed to the console. Use:

```r
logger::log_appender(logger::appender_file(<file>))
```

to save logs to a file.

# Task

1. Log information about values of inputs used in a session.
2. Log the moment a session starts and stops. (Hint: see documentation of `shiny::onStop` function.)
3. Log the moment the app starts and stops. (Hint: Also see `shiny::onStop` function.)
4. Open the app in at least 2 browser windows and observe when certain app lifecycle events were logged.
