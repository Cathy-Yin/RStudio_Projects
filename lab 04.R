# Exercise 1
fizz_buzz <- function(x) {
  a <- x
  for (i in 1:length(x)) {
    if (a[i] %% 3 == 0 & a[i] %% 5 == 0) {
      x[i] = "fizzbuzz"
    } else if (a[i] %% 3 == 0) {
      x[i] = "fizz"
    } else if (a[i] %% 5 == 0) {
      x[i] = "buzz"
    } else {
      x[i] = as.character(x[i])
    }
  }
  return(x)
}
fizz_buzz(x = 1:5)
fizz_buzz(x = 10:20)

# Exercise 2
is_leap <- function(x) {
  if ((x %% 4 == 0 & x %% 100 != 0) | x %% 400 == 0) {
    print(TRUE)
  } else {
    print(FALSE)
  }
}
is_leap(1900)
is_leap(1990)
is_leap(2000)
is_leap(2010)
is_leap(2016)

# Exercise 3
gen_mult_seq <- function(first, multi, length) {
  ans <- c()
  for (i in 1:length) {
    product <- multi ^ (i-1) * first
    ans <- c(ans,product)
  }
  return(ans)
}
gen_mult_seq(6,5,4)
gen_mult_seq(2,6,7)
gen_mult_seq(6,8,2)
gen_mult_seq(7,2,2)
gen_mult_seq(10,6,5)
