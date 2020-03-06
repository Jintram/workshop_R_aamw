

# S1.1
#### 1
plus1 <- function(x) {
  y = x+1
  return(y)
}

v1 <- c(1,2,3,4)
m1 <- matrix(c(3,1,5,4), ncol = 2)

plus1(v1)
plus1(m1)

#### e2

findWord <- function(v_strings, word) {
  r = FALSE
  for (s in v_strings) {
    if (s == word) {
      r = TRUE
    }
  }
  return(r)
}

vs <- c('pear', 'apple','car', 'auto')
findWord(vs, 'hola')
findWord(vs, 'apple')

#### 3
findOutliers <- function(v) {
  mu <- mean(v)
  stdev <- sd(v)
  outliers <- c()
  for (x in v) {
    if (x > mu+stdev || x < mu-stdev) {
      outliers <- c(outliers,x)
    }
  }
  return(outliers)
}

v <- c(1,5,1,2,4,6,1,5,7)
findOutliers(v)
v <- c(1.1, 1.03, 8.1, 2.23, 0.56, -0.8, 1.5, -3, 1.3, -0.9, 0.87)
findOutliers(v)

#### 4
oddcount <- function(v) {
  odd_elements <- c()
  for (x in v) {
    if (x %% 2 == 0) {
      odd_elements <- c(odd_elements, x)
    }
  }
  return(length(odd_elements))
}

#### 5
fibonacci <- function(n) {
  series <- c(1,1)
  for (i in seq(3,n)) {
    series[i] <- series[i-1] + series[i-2]
  }
  return(series[n])
}

#### 6
fibonacci <- function(n) {
  series <- c(1,1)
  for (i in seq(3,n)) {
    series[i] <- series[i-1] + series[i-2]
  }
  return(series)
}

#### 7a
findFirstOne <- function(v) {
  return(which(v == 1)[1])
}

findFirstN <- function(v, n) {
  return(which(v == n)[1])
}

# S1.1
##### 1
my_fake_data_matrix <- matrix(runif(4*7), ncol=7)
my_fake_data_matrix[,3]
my_fake_data_matrix[,c(1,3)]
my_fake_data_matrix[,c(T,F,T,F,F,F,F)]
my_fake_data_matrix[c(1,3),seq(4,6)]
sample_conditions = c('control', 'control', 'treatment1', 'treatment1', 'treatment2', 'treatment2', 'treatment1')
my_fake_data_matrix[,sample_conditions=='treatment2']

#### 2
m <- matrix(c(7, 0, 1, 9, 1, 3, 1, 8, 9, 9, 2, 5, 6, 2, 3, 2, 8, 7, 0, 5, 5, 6, 3, 3, 4, 10, 0, 2), ncol=7)
which(m==3, arr.ind = TRUE)

#### 3
z <- matrix(c(1:4), nrow = 2)
colnames(z) <- c('a','b')
z[,1]; z[,'a'] # outputs are the same
rownames(z) <- c('x','y')

#### 4
veg_prices = c(cauliflower=1.7, broccoli=0.74, cucumber=.65, lettuce=.85)
my_shopping_list = c('cauliflower', 'cauliflower', 'broccoli')
veg_prices[my_shopping_list]
veg_prices['carrot'] <- 3.1
2*veg_prices['carrot'] + veg_prices['cucumber']
my_shopping_list = c(carrot=2, cucumber=1)
cost <- 0
for (veg in names(my_shopping_list)) {
  cost <- cost + my_shopping_list[veg]*veg_prices[veg] 
}

#### 5
my_fake_data_matrix <- matrix(runif(4*7), ncol=7)
colnames(my_fake_data_matrix) = c('control', 'control', 'treatment1', 'treatment1', 'treatment2', 'treatment2', 'treatment1')
rownames(my_fake_data_matrix) = c('Heart size', 'Heart rate', 'Heart compaction', 'Mouse size')

my_fake_data_matrix[,colnames(my_fake_data_matrix)=='treatment2']


#### 6
matrix1 <- matrix(runif(10), ncol=5)
matrix2 <- matrix(runif(10), ncol=5)
rm <- rbind(matrix1, matrix2)
cm <- cbind(matrix1, matrix2)

matrix1 <- matrix(runif(10), ncol=2)
matrix2 <- matrix(runif(10), ncol=5)
rm <- rbind(matrix1, matrix2) # gives error
cm <- cbind(matrix1, matrix2) # gives error

