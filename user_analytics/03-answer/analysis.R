library(dplyr)
library(stringr)

get_datetime <- function(x) {
  str_extract(x, "\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}")
}

get_event <- function(x) {
  str_extract(x, "(?<=event=)[^]]*")
}

get_value <- function(x) {
  str_extract(x, "(?<=value=)[^]]*")
}

logs <- data.frame(log = readLines("03/log")) |>
  mutate(
    date = get_datetime(log),
    event = get_event(log),
    value = get_value(log)
  )

# 1.
number_of_sessions <- logs |>
  filter(event == "session_start") |>
  count() |>
  pull(n)

number_of_sessions

# 2.
logs |>
  filter(event == "point_size") |>
  group_by(value) |>
  count()

# 3.
logs |>
  filter(event == "plot_type") |>
  group_by(value) |>
  count()
