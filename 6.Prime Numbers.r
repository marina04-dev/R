prime_numbers <- function(n) {
  # Check if 'n' is greater than or equal to 2
  if (n >= 2) {
    # Create a sequence from 2 to 'n'
    x = seq(2,n)
    # Initialize an empty vector to store prime numbers
    prime_nums = c()
    # Loop trough each number in the sequence from 2 to 'n'
    for (i in seq(2,n)) {
      # Check if 'i' is in the sequence 'x' 
      if (any(x == i)) {
        # Add 'i' to the 'prime_nums' vector
        prime_nums = c(prime_nums, i)
        # Remove multiples of 'i' from the sequence 'x'
        x = c(x[(x%%i) !=0],i)
      }
    }
    # Return the vector of prime numbers
    return(prime_nums)
  }
  else {
    # Stop the function execution and display an error message if 'n' is less than 2
    stop("Input Number should be at least 2.")
  }
}

# Call the 'prime_numbers' function with an argument of 12
prime_numbers(12)
