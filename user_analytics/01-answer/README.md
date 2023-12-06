This is an app that visualizes the `iris` dataset.

We want to learn how users interact with the app and what are the most popular features.

In order to do that we will start from logging user actions in the server side of the app.

We'll use a {logger} package.

Let's add `logger::log_info()` calls before the plot is built to collect information what inputs were used.
