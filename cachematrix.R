## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(the_matrix = matrix()) {
    inv_matrix <- NULL
    
    set_matrix <-function (mtx) {
        the_matrix <<- mtx
        inv_matrix <<- NULL
    }
    
    get_matrix <- function() {
        the_matrix
    }
    
    set_inv <- function(inv){
        inv_matrix <<- inv
    }
    
    get_inv <- function() {
        inv_matrix
    }
    
    list(set_matrix = set_matrix, 
         get_matrix = get_matrix, 
         set_inv = set_inv, 
         get_inv =  get_inv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv<-x$get_inv()
    if(!is.null(inv)){
        return(inv)
    }
    thematrix <-x$get_matrix()
    theinv <- solve(thematrix)
    x$set_inv(theinv)
    theinv
    
}


