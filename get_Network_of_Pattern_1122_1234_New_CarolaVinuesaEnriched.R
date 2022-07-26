
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Library/CloudStorage/Box-Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/")

library(matrixStats)
library(readxl)
library(stringr)


# netwk <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/MDx_project/Homosapiens_comb_hq.txt", header = F)
network <- read.csv("/Users/sar210/Library/CloudStorage/Box-Box/TFH/feature_matrices/Homosapiens_comb_hq.csv")
# Genes <- as.vector(unique(df$Node1))

# selectedGenes <- read.delim("hotnetSelected_Pattern1122_Enriched_CarolaVinuesa.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1234_Enriched_CarolaVinuesa.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1122_Enriched_CarolaVinuesa_50.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1234_Enriched_CarolaVinuesa.txt")

# selectedGenes <- read.delim("hotnetSelected_Pattern1122_S2.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1122_S3.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1122_S4.txt")

# selectedGenes <- read.delim("hotnetSelected_Pattern1234_S2.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1234_S3.txt")
# selectedGenes <- read.delim("hotnetSelected_Pattern1234_S4.txt")

Modules <- unique(selectedGenes$uGenes)

network <- read.csv("/Users/sar210/Box/TFH/feature_matrices/Homosapiens_comb_hq.csv")



selectedGenes <- unique(selectedGenes$uGenes)
# subset_Common <- subset(network, network$Gene_A %in% selectedGenes | network$Gene_B %in% selectedGenes)
subSubset_Common <- subset(network, network$Gene_A %in% selectedGenes & network$Gene_B %in% selectedGenes)

# write.table(subSubset_Common, file = "Network_Pattern_1234_Enriched_CarolaVinuesa.txt", sep = "\t", row.names=F, quote = F)



Subset1 <- subset(netwk, ((netwk$V1 %in% Modules) & (netwk$V2 %in% Modules)))
Subset2 <- subset(Subset1, V1 == V2)
Subset1 <- subset(Subset1, V1 != V2)


# testSubset <- subset(netwk, ((netwk$V1 %in% Modules) | (netwk$V2 %in% Modules)))
# testSubset2 <- subset(testSubset, V1 != V2)


# write.table(Subset1, file = "Network_Pattern_1122_Enriched_CarolaVinuesa.txt", sep = "\t", row.names=F, quote = FALSE)
# write.table(Subset1, file = "Network_Pattern_1234_Enriched_CarolaVinuesa.txt", sep = "\t", row.names=F, quote = FALSE)
# write.table(Subset1, file = "Network_Pattern1122_S2.txt", sep = "\t", row.names=F, quote = FALSE) 


