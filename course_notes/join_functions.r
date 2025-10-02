library(tidyverse)
install.packages("nycflights13")
library(nycflights13)


# row binding -------------------------------------------------------------








# join functions ----------------------------------------------------------

flights
view(flights)

airlines
airports


planes |>
  count(year) |>
  tail()


planes |> 
  count(tailnum) |>
  filter(n > 1)

weather
View(weather)

weather|>
  count(time_hour, origin) |>
  filter(n > 1)

planes |>
  filter(is.na(tailnum))


flights2 <- flights |> 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2

airlines 

flights2 |>
  left_join(airlines)

weather

flights2 |>
  left_join(weather)

flights2 |>
  left_join(planes, join_by(tailnum == tailnum), suffix = c("_flight", "_planes"))

flights2
airports

flights2 |>
  left_join(airports, join_by(origin == faa))


airports <- airports |>
  select(faa, name, lat, lon)





fship <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")

ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")

rking <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

lotr <- bind_rows(fship, ttow, rking)
