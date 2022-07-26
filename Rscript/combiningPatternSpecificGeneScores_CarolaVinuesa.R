
rm(list = ls())
cat("\014")

library(e1071)
library(randomForest)
library(tree)
library(gbm)
library(matrixStats)
library(readxl)
library(cvAUC)

setwd("/Users/sar210/Library/CloudStorage/Box-Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/")

CV <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/CarolaVinuesa_signallingPathway.txt")
CV <- CV$Genes

atac <- read.delim("atac.scorescombined.txt")
k4me1 <- read.delim("k4me1.scorescombined.txt")
k4me3 <- read.delim("k4me3.scorescombined.txt")
k27ac <- read.delim("k27ac.scorescombined.txt")


df <- rbind.data.frame(atac, k4me1, k4me3, k27ac)

pattern1122 <- subset(df, PatternDef == 1122)

pattern1234 <- subset(df, PatternDef == 1234)

# pattern1112 <- subset(df, PatternDef == 1112)

pattern_1122_1234 <- subset(df, PatternDef == 1122 | PatternDef == 1234)

# uGenes <- unique(pattern1122$gene)
# uGenes <- unique(pattern1234$gene)
# uGenes <- unique(pattern1112$gene)

uGenes <- unique(df$gene)

uGenes <- unique(pattern_1122_1234$gene)

Score <- c()
for (G in 1:length(uGenes)) {
  
  Gene <- uGenes[G]
  # subDF <- subset(pattern1122, gene == Gene)
  # subDF <- subset(pattern1234, gene == Gene)
  # subDF <- subset(pattern1112, gene == Gene)
  
  subDF <- subset(df, gene == Gene)
  Score[G] <- sum(subDF$scores_npeaks_combined)
}
newDF <- cbind.data.frame(uGenes, Score)

cvDF <- subset(newDF, uGenes %in% CV)
cvDF$Score <- cvDF$Score*10
notCVDF <- subset(newDF, !(uGenes %in% CV))
combine_cvDF <- rbind.data.frame(cvDF, notCVDF)

write.table(combine_cvDF, file = "1122_1234_combined_enriched_CarolaVinuesa.txt", sep = "\t", quote = F,row.names = F)
# write.table(newDF, file = "Pattern_1234_Genes_Scores.txt", sep = "\t", row.names = F)




# write.table(newDF, file = "Patterns_Combined_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(topOrderedPattern, file = "Patterns_Combined_Genes_Scores_top_192.txt", sep = "\t", row.names = F, quote = F)


# atac_1122 <- subset(atac, PatternDef == 1122)
# k4me1_1122 <- subset(k4me1, PatternDef == 1122)
# k4me3_1122 <- subset(k4me3, PatternDef == 1122)
# k27ac_1122 <- subset(k27ac, PatternDef == 1122)
# 
# atac_1234 <- subset(atac, PatternDef == 1234)
# k4me1_1234 <- subset(k4me1, PatternDef == 1234)
# k4me3_1234 <- subset(k4me3, PatternDef == 1234)
# k27ac_1234 <- subset(k27ac, PatternDef == 1234)
# 
# write.table(atac_1122, file = "atac_1122_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(k4me1_1122, file = "k4me1_1122_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(k4me3_1122, file = "k4me3_1122_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(k27ac_1122, file = "k27ac_1122_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# 
# write.table(atac_1234, file = "atac_1234_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(k4me1_1234, file = "k4me1_1234_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(k4me3_1234, file = "k4me3_1234_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)
# write.table(k27ac_1234, file = "k27ac_1234_Genes_Scores.txt", sep = "\t", row.names = F, quote = F)


