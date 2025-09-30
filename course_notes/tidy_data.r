library(tidyverse)

table1 |>
  mutate(rate = cases / population * 10000)

table1 |> 
  group_by(year) |>
  summarize(total = sum(cases))

table1 |>
  ggplot(mapping = aes(x = year, y = cases)) +
  geom_line()

# reshape data to get it into tidy format
# pivot

table4a |>
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

table4b |>
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")

table2 |>
  pivot_wider(names_from = type, values_from = count)

table3 |>
  separate(rate, into = c("cases", "population"), sep = "/")

table3 |>
  separate(year, into = c("century", "year"), sep = 2)

table5 |>
  unite(fullyear, century, year, sep = " ")

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

## plot US cases 

coronavirus |>
  filter(cases > 0) |> 
  group_by(date, type) |>
  summarize(cases = sum(cases)) |>
  ggplot() +
  geom_col(aes(x = date, y = cases, fill = type))

corona_wide <- coronavirus |> 
  pivot_wider(names_from = type, values_from = cases)

coronavirus_ttd <- coronavirus |> 
  group_by(country, type) |>
  summarize(total_cases = sum(cases)) |>
  pivot_wider(names_from = type, values_from = total_cases)

ggplot(coronavirus_ttd) +
  geom_label(mapping = aes(x = confirmed, y = death, label = country))
