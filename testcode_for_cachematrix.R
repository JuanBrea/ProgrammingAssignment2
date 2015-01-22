#test code for assignment 2

source("cachematrix.R")
cmtx <-makeCacheMatrix()

#create matrix
num_row_col <-10
mtx <-matrix(rnorm(num_row_col^2, mean = 2, sd = 2), nrow = num_row_col, ncol = num_row_col)

cmtx <-makeCacheMatrix()
cmtx$set_matrix(mtx)
cacheSolve(cmtx)

cmtx$get_matrix()
cmtx$get_inv()

#check if matrix multiplied by the Inverse == identity matrix
isIdent<-round(cmtx$get_inv()%*%cmtx$get_matrix(),2)
isIdent
cmtx$get_matrix()%*%iSIdent == cmtx$get_matrix()


