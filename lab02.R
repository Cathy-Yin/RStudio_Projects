# Exercise 1
vector1 <- c(0L, 1L, 1L, 2L, 3L, 5L, 8L, 13L, 21L)
vector2 <- c(one = 42, two = 42, three = 3.14)
vector3 <- c("University", "of", "Illinois", "at", "Urbana-Champaign")
my_vector4 <- c(TRUE, TRUE, FALSE)
vector4 <- rep(my_vector4, 10)

# Exercise 2
c_matrix <- matrix(1:100, 25, 4)
r_matrix <- matrix(1:100, 25, 4, byrow = TRUE)

# Exercise 3
x <- 42
list1 <- list(x)
list2 <- matrix(nrow = 5, ncol = 2)
z <- month.name
list3 <- list(z)

# Exercise 4
rm(starter_pokemon)
starter_pokemon <- data.frame (pokedex_num = 1:9,  name = c("Bulbasaur",  "Ivysaur", "Venusaur", "Charmander", "Charmander","Charizard", "Squirtle","Wartortle", "Blastoise"
                                                            ),type_primary = rep(c("Grass", "Fire", "Water"), times = c(3,3,3)),type_secondary = rep(c("Poison"," ", " "),times=c(3,3,3)))
# Exercise 5
pokemon = read.csv("https://stat385.org/data/pokemon.csv")
head(pokemon)
tail(pokemon)
pokemon[1:25, 1:4]
pokemon[pokemon$legendary == TRUE, ]