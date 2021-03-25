library(openxlsx)

mtcars2= cbind(data.frame(car=rownames(mtcars)), mtcars)

write.xlsx(file = '/Users/m.wehrens/Desktop/mtcars.xlsx', x = mtcars2)
