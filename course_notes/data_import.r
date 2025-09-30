library(tidyverse)
library(readxl)
install.packages("readxl")

lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")

#read in data from local computer

write_csv(lotr, file = "lotr.csv")

write_csv(lotr, file = "data/lotr.csv")
lotr <- read_csv("data/lotr.csv")

#specify relative path. Don't set working directory