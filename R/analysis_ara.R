# Initial import of data
# Expects a list of gene-gene interactions, a list of pfam-pfam interactions, and a list of protein-protein interactions.
source("~/Dropbox/R/initialize.R")

############################################################
# Interaction frequency by type at the Domain-Domain level #
summary(domain_interactions_ara$type)
pie(summary(domain_interactions_ara$type), 
    col = c("red","yellow","green","violet"), 
    main = "Distribution of pFam types predicted in Ara")

# What does the distribution of e-values look like?  Where should I set the cut-off?
hist(log10(domain_interactions_ara$eval), 
     xlim = c(-100,10), 
     breaks = 100, 
     main = "Histogram of e-values for Ara")

# Distribution of domain assignments
plot(factor(table(pfam_predictions_ara$gene)), 
     main = "Frequency for number of domains predicted per isoform", 
     ylab = "Frequency", 
     xlab = "Number of domains")
 # another option is #hist(as.data.frame(table(pfam_predictions_ara$gene))$Freq, breaks = seq(0,30,1))

plot(factor(table(pfam_predictions_ara$pred_domain)), 
     main = "Frequency for number of occurances of a pFam accross all isoforms", 
     ylab = "Frequency", 
     xlab = "Number of occurances")


####################################################################
# Lets try creating an iGraph and performing some network analysis #
iGene_ara <- graph.data.frame(gene_interactions_ara, directed=FALSE, vertices=NULL)
iGene_deg_ara <- degree(iGene_ara,mode = "all")

# Distribution of edge degrees
summary(degree(iGene_ara,mode = "all"))
hist(iGene_deg_ara, breaks = 100, 
     main = "Degree distribution of Gene-Gene interactions in Ara")

# Break graph into disconnected subgraphs
dg_ara <- decompose.graph(iGene_ara)
length(dg_ara)

# Graph Intersection
#graph.intersection(g1, g2, keep.all.vertices = FALSE)
