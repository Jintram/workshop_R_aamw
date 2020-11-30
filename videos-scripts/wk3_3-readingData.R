

simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample.txt')
    # note row names are assumed if first line has one entry less

simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample2.txt', header = T)

simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample3.txt', 
        header = T, sep=';', row.names = 1)

