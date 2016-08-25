# The goal of this file is to generate summary statistics for the pFam domain-based interaction predictions.
# install.packages("igraph")

## try http:// if https:// URLs are not supported
#source("https://bioconductor.org/biocLite.R")
#biocLite()

# Use packages
library(igraph)


# Read in v3 data
domain_interactions_v3 <- read.csv("~/Desktop/PPI Network/Apply Interactions/domain_interactions.out", sep="")
protein_interactions_v3 <- read.table("~/Desktop/PPI Network/Apply Interactions/gene_interactions.unique.nonReciprocal", quote="\"", comment.char="")
gene_interactions_v3 <- read.delim("~/Desktop/PPI Network/Apply Interactions/gene_interactions", header=FALSE)
pfam_predictions_v3 <- read.delim("~/Desktop/PPI Network/Apply Interactions/pfam_predictions.tab")


# Read in ara data
domain_interactions_ara <- read.csv("~/Desktop/PPI Network/Apply Interactions ARA/domain_interactions.out", sep="")
protein_interactions_ara <- read.table("~/Desktop/PPI Network/Apply Interactions ARA/gene_interactions.unique.nonReciprocal", quote="\"", comment.char="")
gene_interactions_ara <- read.delim("~/Desktop/PPI Network/Apply Interactions ARA/Standard/gene_interactions", header=FALSE)
pfam_predictions_ara <- read.delim("~/Desktop/PPI Network/Apply Interactions ARA/pfam_predictions.tab")