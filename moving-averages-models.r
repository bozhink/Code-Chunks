N <- 5000

eps <- rnorm(N)

X <- eps
acf(X, plot = TRUE)

X1 <- eps[1:(N-2)] + 0.6*eps[2:(N-1)]
acf(X1, plot = TRUE)

X2 <- eps[1:(N-3)] + 0.6*eps[2:(N-2)] + 0.3*eps[3:(N-1)]
acf(X2, plot = TRUE)