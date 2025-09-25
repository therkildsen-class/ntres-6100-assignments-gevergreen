library(tidyverse)
## install.packages("tidyverse")
install.packages("skimr")
library(skimr)
install.packages("ggplot2")

# read in corona .csv
coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

summary(coronavirus)

skim(coronavirus)
view(coronavirus)
head(coronavirus)
tail(coronavirus)

head(coronavirus$cases)

filter(coronavirus, cases > 0)

filter(coronavirus, country == "US")
filter(coronavirus, country != "US")

filter(coronavirus, date == "2021-09-16", country %in% c("Denmark", "Italy", "Spain"), type == "death")

## use option minus to create the assign key <- 

## use the pipe | to say "and then"

coronavirus |>
  filter(country == "US") |>
  select(-lat, -long, -province)

## subset the dataset to only include daily death counts in US, Canada, Mexico and only variables in order: country, date, cases

coronavirus |>
  filter(country %in% c("US", "Canada", "Mexico"), type == "death") |>
  select(country, date, cases) |>
  ggplot() +
  geom_line (mapping = aes(x = date, y = cases, color = country))

## to check variables
coronavirus |>
  count(country) |>
  View()

## use select to subset variables

vacc <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/main/csv/covid19_vaccine.csv")
View(vacc)

## use mutate to create new variable

max(vacc$date)
vacc |>
  filter(date == max(date)) |>
  select(country_region, continent_name, people_at_least_one_dose, population) |>
  mutate(vaxxrate = people_at_least_one_dose / population)

## add new variable to show how many doses on average have been distributed per person

max(vacc$date)
vacc |>
  filter(date == max(date)) |>
  select(people_at_least_one_dose, doses_admin, country_region, continent_name, population) |>
  mutate(avgdose = doses_admin / people_at_least_one_dose) |>
  ggplot() +
  geom_histogram(mapping = aes(x = avgdose))


max(vacc$date)
vacc |>
  filter(date == max(date), doses_admin > 200 * 10^6) |>
  select(people_at_least_one_dose, doses_admin, country_region, continent_name, population) |>
  mutate(avgdose = doses_admin / people_at_least_one_dose) |>


# Summarize function

coronavirus |> 
  filter(type == "confirmed") |>
  summarize(total = sum(cases) |>
    n = n()) |>
  arrange(-total)

coronavirus |>
  group_by(date,type) |>
  summarize(total = sum(cases)) |>
  filter(date == "2023-01-01")

# which day had the highest death count

coronavirus |> 
  filter(type == "death") |> 
  group_by(date) |> 
  summarize(total_deaths = sum(cases)) |> 
  arrange(-total_deaths)

# With plotting

coronavirus |> 
  filter(type == "death") |> 
  group_by(date) |> 
  summarize(total_deaths = sum(cases)) |> 
  arrange(-total_deaths) |> 
  ggplot() +
  geom_line(aes(x = date, y = total_deaths))

# another exercise

coronavirus |>
  filter(type == "confirmed") |>
  group_by(type) |>
  summarize(total_cases = sum(cases)) |>
  ggplot(mapping = aes(x = date, y = total_cases)) +
  geom_line()

gg_base +
  geom_point()

# don't use pipe for ggplot, use + to add layers


# read in corona .csv
coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

top5_countries <- coronavirus |>
  filter(type == "confirmed") |>
  group_by(country) |>
  summarize(total = sum(cases)) |>
  arrange(-total) |>
  head(5) |>
  pull(country)

coronavirus |>
  filter(type == "confirmed", country %in% top5_countries, cases >= 0) |>
  group_by(date,country) |>
  summarize(total = sum(cases)) |>
  ggplot() +
  geom_line(mapping = aes(x = date, y = total, color = country)) +
  facet_wrap(~ country, ncol =1)
