
# Load some data
raw_data = read.table('/Users/m.wehrens/Data/_2019_10_Mouse_IR/data_Bas/HRMsham1-161216_AHJ7JWBGX2_S8_R2.TranscriptCounts.tsv',
    row.names = 1, header=T)

# Look at data
View(mytable[1:10,1:10])

# total reads per cell
reads_per_cell_raw = apply(raw_data, 2, sum)

# make a plot
library(ggplot2)
plot_data = data.frame(reads=reads_per_cell_raw)
ggplot(plot_data)+
    geom_histogram(aes(x=log10(.1+reads)))

# Dont take cells along with low read counts
read_count_table = raw_data[,reads_per_cell_raw>1000]

# Update read count given we made a selection
reads_per_cell = apply(read_count_table, 2, sum)

# normalize the table
normalized_table = scale(mytable,center = F,scale=reads_per_cell)

# Look at the expression of some marker genes
gene_list = c('Des', 'Mybpc3', 'Myh6', 'Myh7', 'Tnnt2')

# search for those genes in the row names
interesting_genes = grepl(paste0(paste0('^',gene_list,'_'),collapse = '|'),
    row.names(normalized_table))

# Let's check whether this checks out
normalized_table[interesting_genes,1:10]

# Calculate z-scores
normalized_table_zscores = 
    t(scale(t(normalized_table),center = F,scale = T))

# Create a heatmap
library(pheatmap)
pheatmap(normalized_table_zscores[interesting_genes,])

# Create a umap
library(umap)
umap_data = umap(t(normalized_table))

# Create a plot
plot_data = data.frame(umap1=umap_data$layout[,1], umap2=umap_data$layout[,2])
ggplot(plot_data)+
    geom_point(aes(x=umap1, y=umap2))

