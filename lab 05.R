# Exercise 1
find_divisors <- function(x){
  if (x == 1) {
    return(null)
  } else {
    y <- seq_len(x)
    y <- y[ x%%y == 0]
    z <- y[y != x]
  }
  return(z)
}
# find_divisors(21)
is_perfect <- function(x) {
  for(k in 1:x) {
    n = k
    i = 1
    s = 0
    while (i < n) {
      if (n %% i == 0) {
        s = s + i
      }
      i = i + 1
    }
    if (s == n) {
      return(TRUE)
    } else{
      return(FALSE)
    }
    k=k+1
  }
}
is_perfect(6)
is_abundant <- function(x) {
  for(k in 1:x) {
    n = k
    i = 1
    s = 0
    while (i < n) {
      if (n %% i == 0) {
        s = s + i
      }
      i = i + 1
    }
    if (s > n) {
      return(TRUE)
    } else{
      return(FALSE)
    }
    k=k+1
  }
}
is_abundant(18)
is_deficient <- function(x) {
  for(k in 1:length(x)) {
    n = k
    i = 1
    s = 0
    while (i < n) {
      if (n %% i == 0) {
        s = s + i
      }
      i = i + 1
    }
    if (s < n) {
      return(TRUE)
    } else{
      return(FALSE)
    }
    k=k+1
  }
}
# is_deficient(6)
data.frame(
  x = 1:25,
  perfect = sapply(1:25, is_perfect),
  abundant = sapply(1:25, is_abundant),
  deficient = sapply(1:25, is_deficient)
)
# Exercise 2
split_digits = function(x) {
  
  if (!is.numeric(x) | length(x) != 1 | trunc(x) != x) {
    stop("x stop be a numeric vector (that represents an \"integer\") of length 1")
  }
  
  return(as.numeric(strsplit(as.character(x), split = "")[[1]]))
  
}
is_valid <- function(num) {
  if (length(split_digits(x = num)) < 2){
    stop("input numbermust have at least two digits")
  }
  lastdigit = split_digits(num)[length(split_digits(num))]
  others = split_digits(num)[-length(split_digits(num))]
  others = rev(others)
  a = seq(2,length(others),by=2)
  b=a
  c=-b
  doubled=b*2
  w = c()
  for (i in 1:length(doubled)) {
    w[i] = sum(split_digits(doubled[i]))
  }
  s=sum(w)+sum(c)
  return(10-s %%10 == lastdigit)
}