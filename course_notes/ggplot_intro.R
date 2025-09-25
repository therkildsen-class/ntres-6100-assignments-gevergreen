library(tidyverse)

mpg
?mpg
?cars
cars

View(mpg)

ggplot(data = mpg)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class, size = cyl), shape = 1)

?geom_point

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class, size = cyl), 
             shape = 1) + geom_smooth() + facet_wrap(~ year, nrow = 2) +
  theme_classic()     
