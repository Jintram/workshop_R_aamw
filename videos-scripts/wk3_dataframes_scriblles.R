

names     = c('Amanda','Lucas','Thomas')
surnames  = c('Millen','Galli','Lim')
labs      = c('Kops','Van Rooij','NA')
age       = c(35,23,29)

data_frame_example = 
    data.frame( names=names,
                surnames=surnames,
                lab_person_is_member_of=labs,
                age=c(35,23,29)
                )

# accessing the data
data_frame_example

data_frame_example$age
data_frame_example[[4]]
data_frame_example[['age']]
data_frame_example[  , 4 ]
data_frame_example[  , 2:4 ]
data_frame_example[  , c('age','age','names') ]

data_frame_example[  1:2 , 2:4 ]

data_frame_example$lab_person_is_member_of == 'Kops'
data_frame_example[ data_frame_example$lab_person_is_member_of == 'Kops' ,  ]
data_frame_example[ c(T,F,F) ,  ]

data_frame_example$
order(c(2,4,1,5,4))

c(2,4,1,5,4)[c(3, 1, 2, 5, 4)]

series = c(2,4,1,5,4)
series[order(series)]

sort(series)

data_frame_example[
    order(data_frame_example$age, decreasing = T),]

data_frame_example[
    order(data_frame_example$age, decreasing = F),]


data_frame_example$years_working_here =
    c(2,4,10)

data_frame_example[[6]] =
    c(1,1,1)

data_frame_example[4,] = 
    list('Martijn','Wehrens','Van Rooij',34,2,1)





