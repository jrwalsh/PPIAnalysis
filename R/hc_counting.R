out <- read.delim("~/git/PPI-Network/PPI-Network/Results/Arabidopsis/newTest/out")
predictable.HC.interactions <- read.delim("~/git/PPI-Network/PPI-Network/Data/Arabidopsis/predictable HC interactions", header=FALSE)
hc_counts <- read.table("~/git/PPI-Network/PPI-Network/Results/Arabidopsis/newTest/hc_counts.final", quote="\"", comment.char="")
names(hc_counts) <- c("Source", "Target", "TotalCounts", "UniqueCounts")


plot(density(out$UniqueCount), xlim=c(0,5))
lines(density(hc_counts$UniqueCounts), col="red")

plot(density(out$TotalCount), xlim=c(0,50))
lines(density(hc_counts$TotalCounts), col="red")


hist((out$UniqueCount), 
     xlim = c(0,30), 
     breaks = 80, 
     main = "Histogram of e-values for Ara")


