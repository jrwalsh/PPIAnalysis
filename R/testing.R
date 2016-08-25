assumed_pfam_interactions_counts <- read.table("~/git/PPIAnalysis/Data/assumed_pfam_interactions_counts", quote="\"", comment.char="")
plot(density(assumed_pfam_interactions_counts$V1))
