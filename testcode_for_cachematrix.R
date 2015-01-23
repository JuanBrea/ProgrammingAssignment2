#test code for assignment 2

source("cachematrix.R")

#create matrix
num_row_col <-10
mtx <-matrix(rnorm(num_row_col^2, mean = 1, sd = 2), nrow = num_row_col, ncol = num_row_col)
# Create matrix object
cmtx <-makeCacheMatrix(mtx)

# Should get NULL 
cmtx$get_inv()

#solve it and try again
cacheSolve(cmtx)
cmtx$get_inv()
cmtx$get_matrix()


#check if matrix multiplied by the Inverse == identity matrix
# Diagonal is all '1'
isIdent<-round(cmtx$get_inv()%*%cmtx$get_matrix(),2)
isIdent
# Just for kicks. See if ident does not change original matrix
cmtx$get_matrix()%*%isIdent == cmtx$get_matrix()


