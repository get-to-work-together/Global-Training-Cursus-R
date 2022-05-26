
# -------------------------------------------------------
# apply()
#
# apply(X, MARGIN, FUN, ...)
#
# MARGIN - MARGIN=1, it applies over rows, 
#          MARGIN=2, it works over columns
#

# Construct a 5x6 matrix
X <- matrix(rnorm(30), nrow=5, ncol=6)

# Sum the values of each column with `apply()`
apply(X, MARGIN=2, FUN=sum)

# Sum the values of each row with `apply()`
apply(X, MARGIN=1, FUN=sum)

# -------------------------------------------------------
# lapply()

lapply(X, MARGIN=2, FUN=sum)

# -------------------------------------------------------
# sapply()

sapply(X, MARGIN=2, FUN=sum)

# -------------------------------------------------------
# mapply()

mapply(rep, 1:4, 4)


