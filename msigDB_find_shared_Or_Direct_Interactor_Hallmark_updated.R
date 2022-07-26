
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Library/CloudStorage/Box-Box/TFH/feature_matrices/")
# setwd("/Users/syedashiqurrahman/Box/TFH/feature_matrices/")

library(matrixStats)
library(readxl)
library(stringr)
library(msigdbr)

# df <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/MDx_project/generated_distance_combined.txt")

netwk <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/MDx_project/Homosapiens_comb_hq.txt", header = F)
hop.distance <- rep(1, nrow(netwk))
df <- cbind.data.frame(netwk, hop.distance)
names(df) <- c("Node1", "Node2", "hop.distance")

Genes <- as.vector(unique(df$Node1))

# selectedGenes <- read.delim("Pattern1122_HotnetSelectedGenes.txt")
# selectedGenes <- read.delim("Pattern1112_HotnetSelectedGenes.txt")
# selectedGenes <- read.delim("Pattern1234_HotnetSelectedGenes.txt")
selectedGenes <- read.delim("PatternCombined_1122_1234_HotnetSelectedGenes.txt")
# selectedGenes <- read.delim("PatternCombined_HotnetSelectedGenes.txt")


Modules <- unique(selectedGenes$uGenes)
# X <- msigdbr_collections()

h_gene_sets = msigdbr(species = "Homo sapiens", category = "H")
GS_NAME <- unique(h_gene_sets$gs_name)

M <- matrix(0, nrow = length(GS_NAME), ncol = 4)

# i = 1
for(i in 1:length(GS_NAME)){
  
  gs <- GS_NAME[i]
  sub_gene_set <- subset.data.frame(h_gene_sets, gs_name == gs)
  TNF <- sub_gene_set$human_gene_symbol
  
  TNFSubset1 <- subset(df, ((df$Node1 %in% Modules) & (df$Node2 %in% TNF)))
  TNFSubset2 <- subset(df, ((df$Node2 %in% Modules) & (df$Node1 %in% TNF)))
  
  TNFSubset12 <- cbind.data.frame(c(TNFSubset1$Node1, TNFSubset2$Node2), c(TNFSubset1$Node2, TNFSubset2$Node1), c(TNFSubset1$hop.distance, TNFSubset2$hop.distance))
  names(TNFSubset12) <- c("Node1", "Node2", "hop.distance")
  
  test1 <- subset(TNFSubset12, hop.distance <= 1)
  
  M[i, 1] <- length(unique(test1$Node2))
  M[i, 3] <- length(unique(test1$Node1))
  
  # Pathways <- c()
  # MODs <- c()
  # j <- 1
  # for (j in 1:10){ 
  #   
  #   Random <- sample(setdiff(unique(c(df$Node1, df$Node2)), c(Modules,TNF)), size = length(Modules))
  #   
  #   randomSubset1 <- subset(df, ((df$Node1 %in% TNF) & (df$Node2 %in% Random)))
  #   randomSubset2 <- subset(df, ((df$Node2 %in% TNF) & (df$Node1 %in% Random)))
  #   
  #   randomSubset12 <- cbind.data.frame(c(randomSubset1$Node1, randomSubset2$Node2), c(randomSubset1$Node2, randomSubset2$Node1), c(randomSubset1$hop.distance, randomSubset2$hop.distance))
  #   names(randomSubset12) <- c("Node1", "Node2", "hop.distance")
  #   
  #   testRandom1 <- subset(randomSubset12, hop.distance <= 1)
  #   
  #   Pathways[j] <- length(unique(testRandom1$Node1))
  #   MODs[j] <- length(unique(testRandom1$Node2))
  # }
  # 
  # M[i, 3] <- mean(Pathways)
  # M[i, 4] <- mean(MODs)
  
  
}

# write.csv(M, "results_pattern1122_hallmark.csv")
# write.csv(M, "results_pattern1112_hallmark.csv")
# write.csv(M, "results_pattern1234_hallmark.csv")
# write.csv(M, "results_pattern_1122_1234_hallmark.csv")
write.csv(M, "results_patternCombined_hallmark.csv")
# write.csv(GS_NAME, "Hallmark_Pathway.csv")


