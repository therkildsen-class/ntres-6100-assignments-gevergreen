# install.packages("usethis")
library(usethis)

## use_git_config function with my username and email as arguments
use_git_config(user.name = "gevergreen", user.email = "evergreen.gabriella@gmail.com")


install.packages("gitcreds")
library(gitcreds)

gitcreds_set()
