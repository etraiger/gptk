gaussSamp <- function(mu=matrix(0,nrow=dim(Sigma)[1]), Sigma, numSamps) {

## GAUSSSAMP Sample from a Gaussian with a given covariance.
## FORMAT 
## DESC samples a given number of samples from a Gaussian with a
## given covariance matrix.
## ARG MU: the mean vector of the Gaussian to sample from.
## ARG Sigma : the covariance of the Gaussian to sample from.
## ARG numSamps : the number of samples to take from Gaussian.
## RETURN y : the samples from the Gaussian
##
## SEEALSO : rnorm, eigen
##
## COPYRIGHT : Neil D. Lawrence 2005, Alfredo Kalaitzis 2010

  eigVecs = eigen(Sigma)
  U = eigVecs$vectors; V = eigVecs$values
  dims = dim(Sigma)[1]
  y = matrix(rnorm(numSamps*dims), numSamps, dims)
#   V[V<0] = as.complex(V[V<0])
  y =  matrix(1,nrow=numSamps)%*%t(mu) + y %*% diag(sqrt(abs(V))) %*% t(U)

  return (Re(y))
}
