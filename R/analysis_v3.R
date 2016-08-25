# Initial import of data
# Expects a list of gene-gene interactions, a list of pfam-pfam interactions, and a list of protein-protein interactions.
source("~/Dropbox/R/initialize.R")

############################################################
# Interaction frequency by type at the Domain-Domain level #
summary(domain_interactions_v3$type)
pie(summary(domain_interactions_v3$type), 
    col = c("red","yellow","green","violet"), 
    main = "Distribution of pFam types predicted in v3")

# What does the distribution of e-values look like?  Where should I set the cut-off?
hist(log10(domain_interactions_v3$eval), 
     xlim = c(-100,10), 
     breaks = 100, 
     main = "Histogram of e-values for v3")

# Distribution of domain assignments
plot(factor(table(pfam_predictions_v3$gene)), 
     main = "Frequency for number of domains predicted per isoform", 
     ylab = "Frequency", 
     xlab = "Number of domains")
 # another option is #hist(as.data.frame(table(pfam_predictions_v3$gene))$Freq, breaks = seq(0,30,1))

# Which genes have this specific number of pfam annotations?
which(factor(table(pfam_predictions_v3$gene)) == 28)
factor(table(pfam_predictions_v3$gene))[9451]
summary(pfam_predictions_v3[which(gene == 'GRMZM2G044306_P01'),])

# Show counts of the pfam assignments for each protein
domainTable <- table(pfam_predictions_v3$gene, pfam_predictions_v3$type)
addmargins(domainTable, margin = 2)

plot(factor(table(pfam_predictions_v3$pred_domain)), 
     main = "Frequency for number of occurances of a pFam accross all isoforms", 
     ylab = "Frequency", 
     xlab = "Number of occurances")


####################################################################
# Lets try creating an iGraph and performing some network analysis #
iGene_v3 <- graph.data.frame(gene_interactions_v3, directed=FALSE, vertices=NULL)
iGene_deg_v3 <- degree(iGene_v3,mode = "all")

# Distribution of edge degrees
summary(degree(iGene_v3,mode = "all"))
hist(iGene_deg_v3, breaks = 100, 
     main = "Degree distribution of Gene-Gene interactions in v3")

# Break graph into disconnected subgraphs
dg_v3 <- decompose.graph(iGene_v3)
length(dg_v3)

# Graph Intersection
#graph.intersection(g1, g2, keep.all.vertices = FALSE)
