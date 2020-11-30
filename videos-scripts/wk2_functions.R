
# what is a function? --> pre-defined code that performs certain task
# why use a function? --> to perform repetitive tasks
#                     --> create "lego blocks" to build more complicated code
# e.g. load and normalize sample data

# in fact, we're constantly using functions
# e.g. print, sqrt, mean, sum, etc
# and there are many function written already
# that allow you to perform all kinds of actions

# most of the R code will revolve around calling functions

# let's see how to write our own function

# we've briefly talked about functions before, 
sqrt(5)


# how to make our own?

# simplest function

example_function <- function() {
    
    print("hello")
    
}






# input and output
example_function_2 <- function(a) {
    
    b = a^2
    c = a+a
    
    return(b)
    
}
# note that a and b are "made" inside the function, and are also "forgotten"
# once the function is done





# function with multiple arguments (defaults), more complex code, 
# and more complex return arguments (e.g. list)

yet_another_function <- function(a=2, b=4, c=1, some_other_parameter=200, blabla='hallo') {
    
    z = a+b+c+some_other_parameter^2
    print(blabla)
    
    return(z)
    
}


# Note that core of course is not necessarily the lectures, 
# but perhaps even more the exercises.
# Some of those might be quite hard; so it might take quite
# a while to solve.
# Maybe you get stuck after only two exercises -- for that 
# purpose we have the (online) meetings.




