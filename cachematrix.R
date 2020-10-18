## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#"makeCachematrix" is a function that creates the matrix of the data. It also caches the inverse of the matrix.

# I USED TO USE "=" TO ASSIGN VARIABLES INSTEAD OF "<-". PLEASE CONSIDER THAT.
# I USED TO USE "=" TO ASSIGN VARIABLES INSTEAD OF "<-". PLEASE CONSIDER THAT.
# I USED TO USE "=" TO ASSIGN VARIABLES INSTEAD OF "<-". PLEASE CONSIDER THAT.

makeCacheMatrix = function(x = matrix()) {
  inv = NULL
  set = function(y){
    x <<- y
    inv <<- NULL
  }
  get = function() x
  set_inverse = function(inverse) inv <<- inverse
  get_inverse = function() inv
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
}



## Write a short comment describing this function
#This functon gives the inverse matrix obtained (cached) in "makeCacheMatrix".

cacheSolve = function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv = x$get_inverse()
  if(!is.null(inv)) {
    message("getting cached matrix inverse")
    return(inv)
  }
  data = x$get()
  inv = solve(data, ...)
  x$set_inverse(inv)
  inv
}

##TESTRUN ##TESTRUN ##TESTRUN ##TESTRUN ##TESTRUN ##TESTRUN ##TESTRUN ##TESTRUN
##> matrix_pill <- makeCacheMatrix(matrix(1:8,2,2))
##> matrix_pill$get()
##     [,1] [,2]
##[1,]    1    3
##[2,]    2    4
##> cacheSolve(matrix_pill)
##     [,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
