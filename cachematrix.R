
# makeCacheMatrix makes a list with three functions that lets it return the matrix, return the inverse of the matrix
# and set the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL                 #sets inverse to Nothing
    get <- function() x             #used later in cacheSolve so that it can create an inverse
    set_inverse <- function(solved_inverse) inverse <<- solved_inverse #sets the inverse value after cacheSolve creates it
    get_inverse <- function() inverse #gives the inverse value to the variable invese in the other function when called
    list(get = get, set_inverse = set_inverse, get_inverse = get_inverse) #makes this entire function a giant list
}

# cacheSolve checks to see if the inverse exists, if it does it returns it, if not it solves it and sets it in makeCacheMatrix

cacheSolve <- function(x, ...) {
    inverse <- x$get_inverse()  #gets the value of the inverse from the other function, if this is the first time the matrix is called it NULL
    if(!is.null(inverse)){      # checks to see if the value of inverse is NULL if not it just returns it
        message("Please Wait as we get your cached data")
        return(inverse)
    }
    data <- x$get()         # Gets the matrix data from the other function
    inverse1 <- solve(data) # Stores the solved version of the matrix
    x$set_inverse(inverse1) #Stores the solved matrix back in the other function
    inverse1                #This one's is self explanatory, hope you enjoyed reading my code  
        
}
