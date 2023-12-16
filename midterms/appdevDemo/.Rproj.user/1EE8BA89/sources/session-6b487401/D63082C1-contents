#PROFILING

# Load the 'utils' package
library(utils)

# Function 1: Double the sum of a and b
addition_multiplication <- function(a, b) {
  result <- a + b
  result <- result * 2
  return(result)
}

# Function 2: Divide the difference of a and b
subtraction_division <- function(a, b) {
  result <- a - b
  result <- result / 2
  return(result)
}

# Function 3: Main function to profile
main_function <- function(n) {
  total_result <- 0
  for (i in 1:n) {
    function1_result <- addition_multiplication(i, i + 1)
    function2_result <- subtraction_division(i, i + 1)
    total_result <- total_result + (function1_result + function2_result)
  }
  return(total_result)
}

# Start profiling
data = "profile_data.prof"  # output file  containing the data being processed
Rprof(data)

# Execution of main_function
n <- 100000
result <- main_function(n)

# Stop profiling
Rprof()

# Analyze the profile data
summary_data <- summaryRprof(data) # summarizes the retrieved data
print(summary_data)

#profiling-efficient way of showing which functions takes the most time to execute and needs
#self-time()
