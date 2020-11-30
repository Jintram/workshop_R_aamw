
# parameters 
a = 1

# vectors
b = c(1,2,3)
c = c('hi','hello','bye')

# if statements
if (c[1] == 'hi') {
 print('first element is hi!')   
} else {
 print('hi is not first element!')   
}

# for loop
result = FALSE
for (element in c) {
    
    if (element == 'hi') {
        result = TRUE
    }
    
}
if (result) {
 print('hi is in there')   
} else { print ('not there') }

# functions
some_function = function(input) {
    
    for (element in input) {
    
    print(paste0('computer says: ',element))
    
    }
}
# some_function(input=c(1,2))

# matrices
some_matrix = matrix(1:12, nrow = 3)
some_matrix[c(1,2),]
some_matrix[,c(1,2)]










