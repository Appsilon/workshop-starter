# shiny.telemetry

> The shiny.telemetry R package tracks events occurring on a user session, such as input changes and session duration, and stores them in a local or remote database.

> It provides developers with the tools to help understand how users interact with Shiny dashboards and answer questions such as: which tabs/pages are more often visited, which inputs users are changing, what is the average length of a session, etc.

https://appsilon.github.io/shiny.telemetry/index.html

# Task

Let's use `shiny.telemetry` to record all user interactions with and explore log storage options and logs analysis app.

## Data providers

There are 3 different types of data providers that can range from local filesystem storage to a remote Plumber REST API instance.

- Local file:
  - SQLite using DataStorageSQLite class
  - Logfile using DataStorageLogFile class
- Remote SQL database:
  - MariaDB using DataStorageMariaDB class
  - PostgreSQL using DataStoragePostgreSQL class
  - MS SQL Server using DataStorageMSSQLServer class
- Plumber REST API using DataStoragePlumber class
  - In turn, the Plumber data provider will use one of the other classes above as the method of data storage.

In the exercise let's use the default `SQLite` data provider.
