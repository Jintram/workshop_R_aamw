
########################################################################
# For loops

# For loops
print("Hello world 1")
print("Hello world 2")
print("Hello world 3")
print("Hello world 4")
print("Hello world 5")
print("Hello world 6")

# A for loop
for (idx in c(1,2,3,4,5,6)) {
    
    print("Hello world")
    print(idx)
    
}

# A for loop 2
for (idx in 1:6) {
    
    print("Hello world")
    print(idx)
    
}

# A for loop 3
for (some_word in c('hoi', 'lalalala', 'doei')) {
    
    print(some_word)
    
}


# A for loop 3
for (x in 1:5) {
    
    y = x+x+10
    z = 23*x+100
    print(y+z)
    
}

########################################################################

# If statements

if (TRUE) {
    
    print('hi')
    
}

if (FALSE) {
    
    print('hi')
    
}


if (FALSE) {
    
    print('hi')
    
} else {
    
    print('ciao')
    
}

# (....)

x = 10

if (x > 1) {
    
    print('hi')
    
} else {
    
    print('ciao')
    
}

# 
some_parameter = '23_something'
if (some_parameter == '23_something') {
    
    print('Do something here!')
    
} else {
    
    print('Do something entirely different here!')
    
}

# 
some_parameter = 'elkhklejhtklh'
if (some_parameter == '23_something') {
    
    print('Do something here!')
    
} else if (some_parameter == '24_something') {

    print('Very important code right here.')

} else {
    
    print('Do something entirely different here!')
    
}







