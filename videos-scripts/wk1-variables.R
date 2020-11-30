# Week 1, s2, commands used to illustrate vectors

# some example vector
a = c(12,3,4,54,2,23,32,23,1)
b = c('hoi','hallo','doei')

# vector indexing
a[1]
a[5]
c(1,2)
a[c(1,2)]
a[c(1,2,3)]
a[1:4]
a[c(1,3)]
a[c(-1,-2,-3)]
a[c(T,T,T,T,F,F,F,F,F)]

# some example vector
d = c(12,3,4,54,2,23,32,23,1)
d[5] = 777
d[c(1,2)] = c(293847,203947)

# we can do math with vectors
e = c(12,3,4,54,2,23,32,23,1)
c(1,2) + c(3,4)
c(1,2) - c(3,4)
c(1,2) * c(3,4)
c(1,2) / c(3,4)

# now we can also 
e = c(12,3,4,54,2,23,32,23,1)
e > 5
e[e > 5]
e[e > 0]
e[e >= 1]
e[e == 23]

# To repeat a pattern
rep(8,4)
rep(x = 8, times = 3)
rep(x = c(8,2), times = 3)
rep(x = c(8,2), each = 3)






