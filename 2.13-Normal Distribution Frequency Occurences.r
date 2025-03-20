# Generate 1000 random numbers from a normal distribution
# with mean 50 and standard deviation 100, and round them
# down to the nearest integer
n = floor(rnorm(n=100, mean=50, sd=100))
print(n)

# Create a frequency table of the occurences of each unique value in 'n'
t = table(n)
print(t)
