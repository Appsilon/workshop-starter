library(shiny.telemetry)

storage <- DataStorageSQLite$new(db_path = "04-user_analytics/04-answer/telemetry.sqlite")
analytics_app(storage)

logs <- storage$read_event_data("2020-01-01", "2050-01-01")

# 1.
number_of_sessions <- logs |>
  filter(type == "login") |>
  count() |>
  pull(n)

number_of_sessions

# 2.
logs |>
  filter(id == "point_size") |>
  group_by(value) |>
  count()

# 3.
logs |>
  filter(id == "plot_type") |>
  group_by(value) |>
  count()
