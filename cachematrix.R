
## makecacheMatrix() will create a new object with interfaces to manipulate a matrix
## Returns a list containing:
## set_matrix(mtx) stores a new matrix in the object and sets it's inverse to NULL
## get_matrix() return the matrix currently stored
## set_inv(inv) allows for the matrix inverse to be saved. Intended to be invoked  from CacheSolve()
## get_inv() returns the inverse of the current matrix
makeCacheMatrix <- function(the_matrix = matrix()) {
    #Creating for the first time. Set inv to null
    inv_matrix <- NULL
    
    set_matrix <-function (mtx) {
        the_matrix <<- mtx
        # the matrix has changed. Set inv to NULL
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


## cacheSolve(x) calculates the inverse of the matrix stored in object x
## First tries to retrieve the inverse of the matrix 
## If no inverse exists it retrieves the matrix stored, cacluates it's inverse and stores it in x
## Returns the matrix invese or NULL if no matrix exists

cacheSolve <- function(x, ...) {

    inv<-x$get_inv()
    if(!is.null(inv)){
        #Found the inverse. No need to solve the matrix
        return(inv)
    }
    thematrix <-x$get_matrix()
    if(is.null(thematrix)){
        # No matrix found either
        return (NULL)
    }
    # Calculate the inverse and store it for future use
    theinv <- solve(thematrix)
    x$set_inv(theinv)
    theinv
    
}


