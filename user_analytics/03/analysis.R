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

logs <- data.frame(log = readLines("04-user_analytics/03/log")) |>
  mutate(
    date = get_datetime(log),
    event = get_event(log),
    value = get_value(log)
  )

# Let's answer some research questions!
# 1. How many sessions were run? Is it in line with your expectations for this app (are there too few sessions, too many)?
# 2. Which point size was used most often? Do users like the default value?
# 3. Which plot type is used most often?
