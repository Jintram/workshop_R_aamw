
# Read in data
setwd('/Users/m.wehrens/Data/__misc_data/r-course-aamw/wk3')
mdf <- read.table('metadata_pancreas_scRNAseq.tsv', sep = '\t', header = TRUE, stringsAsFactors = FALSE)

# Col & row names
colnames(mdf)
rownames(mdf)

# cell types are annotated in this metadata
unique(mdf$cell.subtype)

# 
# There's more sophisticated ways of doing this, 
# but this is a way using the information
# you've got up till now
for (celltype in c('beta', 'alpha', 'PP', 'delta')) { 
# or: for (celltype in unique(mdf$cell.subtype)) { 
    print(paste0('cells with type ', celltype , ' = ', sum(mdf$cell.subtype==celltype)))
}
# can of course be automated further


unique(mdf$ethnicity)

##########

edf <- read.table('expression_pancreas_scRNAseq.tsv.gz', sep = '\t', row.names = 1, header = TRUE)

head(edf)


##########

df <- read.table('SRR1248457_methylationdata.cov.gz', sep = '\t', header = FALSE)
