# Exercise1 
vector1 <- c(0, 1, 1, 2, 3, 5, 8, 13, 21)
vector2 <- 1:25
vector3 <- seq(2,20,2)
vector4 <- c("rock","paper","scissors") 

# Exercise2
vector_1 <- 1:10
vector_2 <- c(0,5)
vector_1 + vector_2 #every elements in vector_1 plus every elements in vector_2

# Exercise3
add_maxes <- function(x,y){
  a<- max(x)
  b<- max(y)
  sum(a+b)
  }
add_maxes(x = 1:10, y = 1:20)
add_maxes(x = runif(100), y = runif(100))

# Exercise4
data<- c("rock","paper","scissors")
rock_paper_scissors<- function(){
  dice<-sample(data,size=2,replace=T)
  print(dice)
}
rock_paper_scissors()
rock_paper_scissors()
rock_paper_scissors()

# Excercise5
rps_extended<-function(shapes=c("rock", "paper", "scissors"),n_players=2){
  dice<-sample(shapes,size=n_players,replace=T)
  print(dice)
}
# running with default arguments. same as running rock_paper_scissors()
# standard game with two players
rps_extended()

# playing rock-paper-scissors-lizard-spock with two players
rps_extended(shapes = c("rock", "paper", "scissors", "lizard", "spock"))

# playing rock-paper-scissors with three players
rps_extended(n_players = 3)

# using frog-slug-snake with Japanese names and three players
rps_extended(shapes = c("namekuji", "kawazu", "hebi"), n_players = 3)
