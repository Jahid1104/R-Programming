#### In R, there are 6 basic data types:
    # logical, numeric, integer, complex, character, raw

#Lets discuss each of these R data types one by one. #


###1. Numeric data type

x = 5.6
print(class(x))         # print the class name of variable
print(typeof(x))        # print the type of variable


###2. Integer data type

x = as.integer(5)       # Create an integer value
print(class(x))         # print the class name of x
print(typeof(x))        # print the type of x

y = 5L                  # Declare an integer by appending an L suffix.
y
print(class(y))         # print the class name of y
print(typeof(y))        # print the type of y


###3. Logical data type

x = 4                   # Sample values
y = 3
z = x > y               # Comparing two values

print(z)                # print the logical value
print(class(z))         # print the class name of z
print(typeof(z))        # print the type of z


###4. Complex data type

x = 4 + 3i              # Assign a complex value to x
print(class(x))         # print the class name of x
print(typeof(x))        # print the type of x


###5. Character data type

char = "GPB"            # Assign a character value to char
print(class(char))      # print the class name of char
print(typeof(char))     # print the type of char


###6. Raw Data Type
x <- as.raw(c(0x1, 0x2, 0x3, 0x4, 0x5))
print(x)
print(class(x))      # print the class name of x
print(typeof(x))     # print the type of x

