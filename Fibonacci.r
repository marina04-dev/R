# Initialize a numeric vector 'Fibonacci' of length 10 with zeros
Fibonacci <- numeric(10)

# Set the first 2 elements of the 'Fibonacci' vector to 1
Fibonacci[1] <- Fibonacci[2] <- 1

# Loop through indices 3 to 10 to calculate Fibonacci numbers
# Each element is the sum of the two preceding elements
for (i in 3:10) {
  Fibonacci[i] <- Fibonacci[i-2] + Fibonacci[i-1]
}

print(Fibonacci)
