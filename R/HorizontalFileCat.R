#https://psychwire.wordpress.com/2011/06/03/merge-all-files-in-a-directory-using-r-into-a-single-dataframe/

# Coexpression files from ATTED-II
# http://atted.jp/download.shtml file version Ath-m.c6-0
# This file comes as a collection of "one-vs-all" comparisons which we would like to merge into a single data frame matching on EntrezID
# Must choose to keep either the MR or PCC value during merge opperation
# This coexpression file set has 20k files, takes ~mins(hrs?) to run the script

setwd("/home/jesse/Downloads/Ath-m.v15-08.G20836-S15275.rma.mrgeo.d")
rm(coexpr)
rm(temp_dataset)

file_list <- list.files()

i <- 0
j <- 1
for (file in file_list){
  # if the merged dataset doesn't exist, create it
  if (!exists("coexpr")) {
    coexpr <- read.table(file, header=TRUE, sep="\t")
    coexpr <- coexpr[,-2]
    #names(coexpr) <- c("EntrezID", "MR", "PCC")
    names(coexpr) <- c("EntrezID", file)
  } else {
    temp_dataset <-read.table(file, header=TRUE, sep="\t")
    #names(temp_dataset) <- c("EntrezID", "MR", "PCC")
    names(temp_dataset) <- c("EntrezID", "MR", file)
    coexpr <- merge(coexpr, temp_dataset[,-2], by = c("EntrezID"), all = TRUE)
    rm(temp_dataset)
  }

  i <- i+1
  if (i == 100) {
    out_file <- file(paste("/home/jesse/Downloads/output/output_", toString(j), ".tab", sep = ""), "w")
    write.table(coexpr, out_file, sep = "\t", row.names = FALSE)
    i <- 0
    j <- j+1
    rm(coexpr)
  }

}

# Last partial file
out_file <- file(paste("/home/jesse/Downloads/output/output_", toString(j), ".tab", sep = ""), "w")
write.table(coexpr, out_file, sep = "\t", row.names = FALSE)
i <- 0
j <- j+1
rm(coexpr)



##########################################################################
# Part 2
##########################################################################
setwd("/home/jesse/Downloads/output")
rm(coexpr)
rm(temp_dataset)

file_list <- list.files()

for (file in file_list){
  # if the merged dataset doesn't exist, create it
  if (!exists("coexpr")) {
    coexpr <- read.table(file, header=TRUE, sep="\t", check.names = FALSE)
    coexpr <- coexpr[,-2]
  } else {
    temp_dataset <-read.table(file, header=TRUE, sep="\t")
    coexpr <- merge(coexpr, temp_dataset, by = c("EntrezID"), all = TRUE, check.names = FALSE)
    rm(temp_dataset)
  }
}

# Last partial file
out_file <- file("/home/jesse/Desktop/ara_coexpression.tab", "w")
write.table(coexpr, out_file, sep = "\t", row.names = FALSE)

