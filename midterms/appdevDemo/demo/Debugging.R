#DEBUGGING

# Increment 'a' by 1
inc <- function(a) {
  a <- a + 1
  return(a)  # Add 'return' to return the incremented value
}

# Decrement 'a' by 1
dec <- function(a) {
  a <- a - 1  # Correct the decrement operation
  return(a)
}

# Reciprocate 'a'
reciprocate <- function(a) {
  if (a == 0)
    stop("Division by zero will occur")
  a <- 1 / a
  return(a)
}

# Define 'myfunc' which calls 'reciprocate', 'inc', and 'dec' functions
myfunc <- function(a) {
  x <- reciprocate(inc(a))
  y <- reciprocate(dec(a))
  result <- x * y
  return(result)  # Add 'return' to return the computed result
}
