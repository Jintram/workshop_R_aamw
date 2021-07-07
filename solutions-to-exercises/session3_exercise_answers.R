#### S0: Recap last time ####
## 1. Generate a matrix filled with random numbers and dimensions of your own choosing.
m <- matrix(runif(50), ncol = 5)

# 2. Calculate the mean of the rows of that matrix.
apply(m, 2, mean)

# 3. Create a new matrix, which is identical to the previous matrix,
#    except that you divide each element by the mean of its corresponding row.
m2 <- m/apply(m, 1, mean)

# 4. Now calculate the row-means again, they should all equal 1 now.
apply(m2, 1, mean)

# 5. In the previous exercises you normalized the matrix by row. Try to do it per column now. 
m3 <- t(t(m)/apply(m, 2, mean))
apply(m3, 2, mean) # this should all be 1's. 

# --------------------------------------------#

#### S1: Data frames & import/export data ####
## 1. Create the following dataframes:
df1 <- data.frame(gene = c('rgma', 'prr18', 'thrap3b', 'cdkn1ba', 'oaz1a'), cluster = c(1,3,2,2,5), replicate = c(1,1,1,2,2))
df2 <- data.frame(gene = c('zeb1a', 'prickle2b', 'cdc34b', 'mpped2', 'krtcap2', 'arl4ab', 'xbp1', 'admp'), cluster = c(4,4,3,4,1,2,4,2), replicate = c(3,3,3,4,4,5,5,5))
df3 <- data.frame(organism = c('zebrafish', 'zebrafish', 'mouse', 'zebrafish', 'celegans'), expression = c(3.12, 5.50, 0.31, 1.00, 90.31), sgRNA = c(T,T,F,F,F))

# a) Explore the output of rbind(df1,df2)
newdf_1 <- rbind(df1,df2)
# => newdf_1 is a new dataframe that contains df1 followed by df2 (one below the other... rbind stands for row bind)

# b) Explore the output of cbind(df1, df3).
newdf_2 <- cbind(df1, df3)
# => newdf_2 is a new dataframe that contains df1 next to df3 (one next to the other... cbind stands for column bind)

# c) Why does rbind(df1, df3) give an error?
rbind(df1, df3) 
# => the error reads as "names do not match previous names". 
# df1 and df3 cannot be rbinded because colnames(df1) are different from colnames(df3). 

# d) From the output of cbind(df1, df3), select those rows that are assigned to zebrafish.
newdf_2[newdf_2$organism=='zebrafish',]

# --------------------------------------------#

## 2. With the following code, we are creating a gene expression table, 
## where each column is a sample and each row a gene. 
## Numbers (now created using random numbers) are supposed to be normalized gene expression values.
dfa <- data.frame(cell1 = runif(10), cell2 = runif(10), cell3 = runif(10), cell4 = runif(10))
row.names(dfa) <- c('g01', 'g02', 'g03', 'g04', 'g05', 'g06', 'g07', 'g08', 'g09', 'g10')
# a) Select the expression values generated for cell 1
dfa_cell1 <- dfa$cell1

# b) Calculate the mean of all the expression values detected for cell 3
mean_cell3 <- mean(dfa$cell3)

# c) Using the function apply obtain the total expression (sum) detected in each cell
total_expr_cell <- apply(dfa, 2, sum)

# d) Again, using the function apply, calculate the mean expression for each gene among the different cells.
mean_expr_gene <- apply(dfa, 1, mean)

# --------------------------------------------#

## 3 Working with metadata. In the repository GSE81608, scRNAseq data from several cells isolated from the pancreas 
## is stored. We downloaded the metadata from this repository and saved it in the file 
## “metadata_pancreas_scRNAseq.tsv”. Import this file to your R session using the following code:
setwd('/Users/anna/Desktop/Rcourse/workshop_R_aamw/list-of-exercises/files_S3') # this is to set the directory to where the data is stored.
mdf <- read.table('metadata_pancreas_scRNAseq.tsv', sep = '\t', header = TRUE)
## If you type head(mdf) or tail(mdf), the first or last few rows of the imported data frame will be printed on screen.

# a) Use the command dim(mdf)to answer how many columns and how many rows are in this file.
dim(mdf) # you should get 1576 rows and 7 columns

# b) Which are the names of each column?
colnames(mdf) # "srr"          "cell.subtype" "gender"       "ethnicity"    "age"          "donor.id"     "condition"   

# c) Which are the names of each row?
row.names(mdf) # range of values from 1 to 1576. Note that each element of this vector is a character/string.

# d) Which different cell types are annotated in this metadata? 
# (Hint: you might want to use the command "unique". This command takes as an input a vector, and
# provides as an output a vector with the unique elements of the input).
unique(mdf$cell.subtype) # beta  alpha PP    delta

# e) Which is the most abundant cell type? And which is the least abundant?
n <- c()
for (ct in unique(mdf$cell.subtype)) {
  n <- c(n, sum(mdf$cell.subtype==ct))
}
names(n) <- unique(mdf$cell.subtype) # most abundant is alpha, least abundant is delta
# a shortcut for this exercise is to use the command 'table':
table(mdf$cell.subtype)

# f) How many different ethnic groups are reported in this metadata?
unique(mdf$ethnicity) # C  H  AI AA

# g) Create a new data frame that contains only cells whose gender is female (F) and
# whose condition is T2D. How many cells are there in total? How many of these
# cells are from the ‘beta’ subtype?
sub_mdf <- mdf[(mdf$gender=='F') & (mdf$condition=='T2D'),]
dim(sub_mdf) # there are 453 cells
table(sub_mdf$cell.subtype) # there are 191 beta cells

# h) Which is the age span of the donors? (that is, how old are the oldest and the youngest donors?)
c(min(mdf$age), max(mdf$age)) # 23 and 68 year old

# i) You can use the 'order' command to sort the rows in a dataframe according to a
# particular criteria. Explore the output data frame of these lines of code:
sdf <- mdf[order(mdf$age),] # this will order the rows of the data frame according to the age (numerically). 
sdf <- mdf[order(mdf$cell.subtype),] # this will order the rows of the data frame according to the cell type (alphabetically). 

# j) Create a vector cell id’s (srr column) from the PP subtype, 
# detected in Female donors from ethnicity C that are younger than 60.
subdfsrr <- mdf[(mdf$cell.subtype=='PP')&(mdf$gender=='F')&(mdf$ethnicity=='C')&(mdf$age<60),]$srr

# k) From these cells, how many come from a diabetic donor? And how many do not?
table(mdf[(mdf$cell.subtype=='PP')&(mdf$gender=='F')&(mdf$ethnicity=='C')&(mdf$age<60),]$condition) # 16 are non-diabetinc, 13 have T2D

# --------------------------------------------#

##  4. Loading data
# a) Go to https://www.timeanddate.com/weather/netherlands/amsterdam/historic and
# scroll down. There is a table of historic weather data. Copy some of these lines, 
# open TextEdit, notepad or some other text editor, and paste the data there. Now, 
# edit the data a bit such that it can be read in by the R function 'read.table()'
# b) Read in the data. 
setwd('/Users/anna/Desktop/Rcourse/workshop_R_aamw/solutions-to-exercises')
df <- read.csv('historic_weather_data.txt', sep = '\t') # find example in the solutions folder
# c) Create two corresponding vectors, one with the time and one with the temperature at that time?
v_time <- df$Time
v_temp <- df$Temp...C.

# --------------------------------------------#

## 5. For the same repository GSE81608 (ex. 3) , we got the gene expression table, 
# which can be found in the file “merge_exon_uniqueCounts.coutb.tsv.gz”.
# Use the following code to import this file as a data frame:
setwd('/Users/anna/Desktop/Rcourse/workshop_R_aamw/list-of-exercises/files_S3') # remember to set the path to the file
edf <- read.table('expression_pancreas_scRNAseq.tsv.gz',sep = '\t', row.names = 1, header = TRUE)

# a) How many cells and how many genes are found in this data frame?
dim(edf) # there are 1576 cells and 4309 genes

# b) 
edf[1:10, 1:5]

# c) Which is the cell with the highest number of counts?
total_transcriptXcell <- apply(edf, 2, sum)
cell_maxTranscripts <- names(total_transcriptXcell)[total_transcriptXcell == max(total_transcriptXcell)] # SRR3542721

# d) Which is the gene with the lowest number of counts? 
#If there is more than one, how many genes have the same lowest number of counts?
total_transcriptXgene <- apply(edf, 1, sum)
min_transcriptXgene <- min(total_transcriptXgene) # the lowest number of transcripts is 1
num_genes_with_mintotaltranscripts <- sum(total_transcriptXgene == min_transcriptXgene) # there are 3411 genes with only 1 transript

# e) Create a new data frame that contains only cells with more than 500000 reads.
# How many cells survive this filtering?
sub_edf <- edf[, total_transcriptXcell>500000]
dim(sub_edf) # there are 804 cells that survive

# f) In the new filtered dataframe, are there genes with a total of 0 detected
# transcripts? If so, filter them out.
sum(apply(sub_edf, 1, sum) == 0) > 0 # this gives as a result a TRUE values, therefore: yes, there are genes with 0 transcripts
sub_edf <- sub_edf[apply(sub_edf, 1, sum) > 0,]

# g) g. Now, we will normalize the data. This means that we will “manipulate” the counts
# per gene per cell so that all cells have the same total number of reads. 
# A common approach is to divide the each gene count in each cell by the total number 
# of counts in that cell. Let’s go step by step:
## i)  Create a new vector that contains the total number of counts per cell in the filtered 
## data set (where cells are sorted in the same order than the data set).
sum_subedf_cells <- apply(sub_edf, 2, sum)
## ii) Create a new data frame that is the transpose of the filtered matrix. 
## That means that in the new data frame, columns become rows and rows become columns. 
## This can be achieved by using the command t(df), where df is the data frame that you 
## want to transpose.
t_sub_edf <- t(sub_edf)
## iii) Now, divide the transpose data frame by the vector created in step (i).
tn_sub_edf <- t_sub_edf/sum_subedf_cells
## iv) Transpose the resulting data frame. This is your normalized data frame.
n_sub_edf <- t(tn_sub_edf)

# h) Compute the total number of reads per cell in your new normalized data frame.
# They should be all equal to 1. If not, that means that we did something wrong.
sum_n_sub_edf <- apply(n_sub_edf, 2, sum)

# i) It is common practice to normalize the total counts per cell to 10000. This way,
# the computer does not need to work with very small numbers (which usually leads to 
# numerical errors). To do so, multiply the normalized data frame by 10000 and assign 
# it to a new variable.
n10000_sub_edf <- 10000*n_sub_edf

# j) Using the metadata information from the previous exercise, create a new data frame 
# that contains the normalized count table for only beta cells and another one that contains
# the normalized count table for only alpha cells.
mdf <- read.table('metadata_pancreas_scRNAseq.tsv', sep = '\t', header = TRUE, stringsAsFactors = FALSE)

allBetaCells <- mdf[mdf$cell.subtype=='beta',]$srr
allAlphaCells <- mdf[mdf$cell.subtype=='alpha',]$srr

beta_n10000_sub_edf <- n10000_sub_edf[,colnames(n10000_sub_edf) %in% allBetaCells]
alpha_n10000_sub_edf <- n10000_sub_edf[,colnames(n10000_sub_edf) %in% allAlphaCells]

# k) Which gene has the highest mean expression in alpha cells?
sort(apply(alpha_n10000_sub_edf, 1, sum), decreasing = TRUE)[1] # GCG! which makes sense

# l) Which 10 genes have the highest mean expression in beta cells?
names(sort(apply(beta_n10000_sub_edf, 1, sum), decreasing = TRUE)[1:10]) # starts with INS, which makes sense

# k) Using the grep command, find the row.name that contains the pattern ‘_INS_’ in its name.
row.names(edf)[grep(pattern = '_INS_', row.names(edf))] # ENSG00000254647_INS__protein_coding

# l) Which 10 genes have the highest mean expression in beta cells?
sum_genes_beta_cells <- sort(apply(edf[mdf[mdf$cell.subtype=='beta',]$srr], 1, sum), decreasing = TRUE)
names(sum_genes_beta_cells[1:10])

# m) Using the grep command, find the row.name that contains the pattern ‘_INS_’ in its name.
grep(pattern = '_INS_', x = row.names(edf))
row.names(edf)[grep(pattern = '_INS_', x = row.names(edf))]

# --------------------------------------------#

## 6. Working with bed files. A bed file is a file made of at least three columns; 
## the first column is the chromosome ID, the second is the start of a genomic feature 
## (exon, intron, promoter, CpG island...), the third is the end of the same genomic feature, 
## and the rest of the columns might contain other information for the same feature.
## Of course, there might be variations to this format. 
## We will now have a look at the file entitled “SRR1248457_methylationdata.cov.gz” with the following line of code:
setwd('/Users/anna/Desktop/Rcourse/workshop_R_aamw/list-of-exercises/files_S3') # remember to set the path to the file
df <- read.table('SRR1248457_methylationdata.cov.gz', sep = '\t', header = FALSE)

# a) a. How many columns are in the imported data frame?
dim(df) # there are 6 columns
length(colnames(df))

# b) Using colnames, rename the columns to: chrom, start, end, frac, meth, unmeth (with this order, please).
colnames(df) <- c('chrom', 'start', 'end', 'frac', 'meth', 'unmeth')

# c) Are columns start and end identical? Why?
all(df$start == df$end)
# => Yes, all start and end columns are identical in every row. The reason is that these bed files
# refers to single positions in the chromosone... therefore, the regions annotated in this bed file are only 1 nucleotide long. 

# d) Columns meth and unmeth contain the number of counts for methylated/unmethylated CpG in each position. 
# Create a new column in the data frame containing the total number of counts for each
# detected CpG.
df['total'] <- df$meth + df$unmeth

# e) In which chromosome is found the CpG that got more counts? And in which
# position of the chromosome? Which is the methylation fraction?
df[df$total == max(df$total),] # it is in chromosome 2; the methylation fraction is 88.77% (6099/6870)

# f) Using the unique(df$chrom) command, you can create a list of all
# chromosomes. Write a for loop that prints out the total number of CpG’s
# detected in each chromosome.
n <- c()
for (chrom in unique(df$chrom)) {
  x <- sum(df[df$chrom==chrom,]$total)
  n <- c(n, x)
}
names(n) <- unique(df$chrom)

# Select all CpG in chromosome 1 that have a methylation fraction not equal to 0
# or 100. What is the mean methylation fraction of these remaining CpG’s? And what is the total number of counts?
subdf <- df[(df$chrom==1)&(df$frac>0)&(df$frac<100),]
mean(subdf$frac)
sum(subdf$total)

# --------------------------------------------#

## 7. Save excel documents. 
# Find out how to save the CpG’s from chromosome 1 that have more than 3 reads (previous exercise) 
# as a data frame in an excel document.
subdf <- df[((df$chrom)==1)&(df$total > 3), ]

install.packages("xlsx")
library("xlsx")
write.xlsx(subdf, 'output_ex7.xlsx', sheetName = "Sheet1", col.names = TRUE, row.names = TRUE, append = FALSE)








