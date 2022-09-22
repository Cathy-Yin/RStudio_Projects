# Exersise 1
rm(list=ls())
set.seed(42)
x = rnorm(100)
y = sample(letters, size = 1000, replace = TRUE)
z = sample(c(TRUE, FALSE, NA), size = 100, replace = TRUE)
a <- sum((x)[x %% 2 == 0])
b <- sum(y %in% c("a","e","i","o","u"))/1000
count <- sum(is.na(z))

# Exercise 2
absurd_list = list(
  q = "Look elsewhere.", 
  y = list(
    z = list(x = 1),
    x = list(x = 2),
    zzz = list(
      zzz = "Not here.",
      zz = list(qq = "gg"),
      a = list(
        b = list(
          q = list(
            answer = list(
              answer = "Hello World!")
          )))
    )
  ))
v <- absurd_list[[2]][[3]][[3]][[1]][[1]][[1]][[1]]

# Exercise 3
head(airquality)
answer<- airquality[rowSums(is.na(airquality)) == 0, ]
all(answer == na.omit(airquality))

# Exercise 4
library(nflreadr)
rosters_2021 = as.data.frame(load_rosters(seasons = 2021))
rosters_2021 <- rosters_2021[!is.na(rosters_2021$college), ]
nfl_illini_2021 <- rosters_2021[rosters_2021$college == "Illinois",c("team","position","jersey_number","full_name","height","weight")]
nfl_illini_2021[nfl_illini_2021 == 606-1] <- 6-0
nfl_illini_2021

# Exercise 5
nfl_2021 = as.data.frame(load_schedules(seasons = 2021))
nfl <-nfl_2021[nfl_2021$home_team == "CHI" | nfl_2021$away_team == "CHI", ]
nfl <- nfl[ ,c("week","away_team", "home_team")]
