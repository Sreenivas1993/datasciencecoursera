## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This function consists of several different functions.  
## 1. set() used to set matrix value.
## 2. get() used to get the matrix
## 3. setinverse() used to set the inverse of matrix
## 4. getinverse() used to get the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
##CacheSolve matrix will check if the inverse of given matrix is ##cached. If it is cached it will return the results.
##Else it will compute the results using solve() and return the ##value.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<-x$getinverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  matr<-x$get()
  inv<-solve(matr,...)
  x$setinverse(inv)
  inv
}
