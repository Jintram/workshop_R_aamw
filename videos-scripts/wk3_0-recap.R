
# parameters
a = 1

# vectors
b = c(1,2,3,4)
c = c('hi','doei','bye')

# if statements
if (c[1] == 'hi') {
    print('1st element is hi')
} else {
    print('1st element is NOT hi')
}

# for loop
result = FALSE
for (word in c) {
    
    if (word == 'hi') {
        result = TRUE
        print('a element is hi')
    } 
    
}

# 
check_if_in_there = function(list_of_words) {
    
    result = FALSE
    for (word in list_of_words) {
        
        if (word == 'hi') {
            result = TRUE
            print('a element is hi')
        } 
        
    }
    
    return(result)
    
}

check_if_in_there(c)

check_if_in_there(c('some','other','words'))

# usually you wouldn't write such simple functions in R
# but this is for illustrative purposes
# here how to do it more quickly:
'hi' %in% c('hi','other','words')

match('hi',c('hi','other','words'))

match('hi',c('nothi','other','words'))


# matrices
some_matrix = matrix(1:12, nrow =3)
some_matrix[c(1,3),]
some_matrix[,c(3,4)]










