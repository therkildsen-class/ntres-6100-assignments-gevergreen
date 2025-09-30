library(tidyverse)
library(readxl)
install.packages("readxl")

lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")

#read in data from local computer

write_csv(lotr, file = "lotr.csv")

write_csv(lotr, file = "data/lotr.csv")
lotr <- read_csv("data/lotr.csv")

#specify relative path. Don't set working directory

lotr_excel <- read_xlsx("data/data_lesson11.xlsx")

install.packages("googlesheets4")
library(googlesheets4)

lotr_google <- read_sheet("https://docs.google.com/spreadsheets/d/1X98JobRtA3JGBFacs_JSjiX-4DPQ0vZYtNl_ozqF6IE/edit#gid=754443596")

gs4_deauth()

deaths <- read_xlsx("data/data_lesson11.xlsx", sheet = "deaths", range = "A5:F15")

msa <- read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/main/datasets/janitor_mymsa_subset.txt")

View(msa)

colnames(msa)
msa_clean <- clean_names(msa)

install.packages("janitor")
library(janitor)

parse_number("$100")
parse_number("80%")
parse_number("It costs $100")
