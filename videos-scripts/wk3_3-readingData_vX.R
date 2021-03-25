

simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample.txt')
    # note row names are assumed if first line has one entry less

my_file_path = '/Users/m.wehrens/Desktop/'
simple_example =
    read.table(file = paste0(my_file_path,'simpleexample.txt'))

setwd('/Users/m.wehrens/Desktop/')
simple_example =
    read.table(file = 'simpleexample.txt')




'/Users/m.wehrens/Desktop/COVID-19_aantallen_gemeente_per_dag.xlsx'

library(xlsx)

table_covid_data = read.xlsx(file = '/Users/m.wehrens/Desktop/COVID-19_aantallen_gemeente_per_dag.xlsx', sheetIndex = 1)

library(openxlsx)

table_covid_data = read.xlsx(
    xlsxFile = '/Users/m.wehrens/Desktop/COVID-19_aantallen_gemeente_per_dag.xlsx')




table_covid_data = openxlsx::read.xlsx(
    xlsxFile = '/Users/m.wehrens/Desktop/COVID-19_aantallen_gemeente_per_dag.xlsx')









simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample2.txt', sep = ';')

simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample3.txt', sep = ';')


simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample2.txt', sep = ';', header = T)




simple_example =
    read.table(file = '/Users/m.wehrens/Desktop/simpleexample3.txt', 
        header = T, sep=';', row.names = 1)



simple_example

new_simple_example = simple_example[-1,-1]
colnames(new_simple_example) = simple_example[1,-1]
rownames(new_simple_example) = simple_example[-1,1]

View(new_simple_example)





