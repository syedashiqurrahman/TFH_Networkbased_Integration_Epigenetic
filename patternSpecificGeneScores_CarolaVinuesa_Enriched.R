
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

# atac <- read.delim("atac.scorescombined.txt")
# k4me1 <- read.delim("k4me1.scorescombined.txt")
# k4me3 <- read.delim("k4me3.scorescombined.txt")
# k27ac <- read.delim("k27ac.scorescombined.txt")


# pattern1122 <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/hotnet2-master/paper/data/heats/Pattern_1122_Genes_Scores.txt", header = F)
# pattern1234 <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/hotnet2-master/paper/data/heats/Pattern_1234_Genes_Scores.txt", header = F)
# names(pattern1122) <- c("Gene", "Score")
# names(pattern1234) <- c("Gene", "Score")

pattern1123 <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/hotnet2-master/paper/data/heats/TFH_new/Pattern_1123_Genes_Scores.txt", header = F)
pattern1223 <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/hotnet2-master/paper/data/heats/TFH_new/Pattern_1223_Genes_Scores.txt", header = F)
pattern1123_1223 <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/hotnet2-master/paper/data/heats/TFH_new/Pattern_1123_1223_Genes_Scores.txt", header = F)

names(pattern1123) <- c("Gene", "Score")
names(pattern1223) <- c("Gene", "Score")
names(pattern1123_1223) <- c("Gene", "Score")

# # df <- pattern1122
# # uGenes <- unique(pattern_1122)
# # 
# # Score <- c()
# # for (G in 1:length(uGenes)) {
# #   
# #   Gene <- uGenes[G]
# #   subDF <- subset(df, gene == Gene)
# #   Score[G] <- sum(subDF$scores_npeaks_combined)
# # }
# # newDF <- cbind.data.frame(uGenes, Score)
# newDF <- pattern1122
# cvDF <- subset(newDF, Gene %in% CV)
# # cvDF$Score <- cvDF$Score*10
# cvDF$Score <- cvDF$Score*50
# notCVDF <- subset(newDF, !(Gene %in% CV))
# combine_cvDF <- rbind.data.frame(cvDF, notCVDF)
# # write.table(combine_cvDF, file = "1122_enriched_CarolaVinuesa.txt", sep = "\t", quote = F,row.names = F)
# write.table(combine_cvDF, file = "1122_enriched_CarolaVinuesa_50.txt", sep = "\t", quote = F,row.names = F)
# 
# newDF <- pattern1234
# cvDF <- subset(newDF, Gene %in% CV)
# # cvDF$Score <- cvDF$Score*10
# cvDF$Score <- cvDF$Score*50
# notCVDF <- subset(newDF, !(Gene %in% CV))
# combine_cvDF <- rbind.data.frame(cvDF, notCVDF)
# # write.table(combine_cvDF, file = "1234_enriched_CarolaVinuesa.txt", sep = "\t", quote = F,row.names = F)
# write.table(combine_cvDF, file = "1234_enriched_CarolaVinuesa_50.txt", sep = "\t", quote = F,row.names = F)

newDF <- pattern1123
cvDF <- subset(newDF, Gene %in% CV)
# cvDF$Score <- cvDF$Score*10
cvDF$Score <- cvDF$Score*50
notCVDF <- subset(newDF, !(Gene %in% CV))
combine_cvDF <- rbind.data.frame(cvDF, notCVDF)
# write.table(combine_cvDF, file = "1123_enriched_CarolaVinuesa_10.txt", sep = "\t", quote = F,row.names = F)
write.table(combine_cvDF, file = "1123_enriched_CarolaVinuesa_50.txt", sep = "\t", quote = F,row.names = F)

newDF <- pattern1223
cvDF <- subset(newDF, Gene %in% CV)
# cvDF$Score <- cvDF$Score*10
cvDF$Score <- cvDF$Score*50
notCVDF <- subset(newDF, !(Gene %in% CV))
combine_cvDF <- rbind.data.frame(cvDF, notCVDF)
# write.table(combine_cvDF, file = "1223_enriched_CarolaVinuesa_10.txt", sep = "\t", quote = F,row.names = F)
write.table(combine_cvDF, file = "1223_enriched_CarolaVinuesa_50.txt", sep = "\t", quote = F,row.names = F)

newDF <- pattern1123_1223
cvDF <- subset(newDF, Gene %in% CV)
# cvDF$Score <- cvDF$Score*10
cvDF$Score <- cvDF$Score*50
notCVDF <- subset(newDF, !(Gene %in% CV))
combine_cvDF <- rbind.data.frame(cvDF, notCVDF)
# write.table(combine_cvDF, file = "1123_1223_enriched_CarolaVinuesa_10.txt", sep = "\t", quote = F,row.names = F)
write.table(combine_cvDF, file = "1123_1223_enriched_CarolaVinuesa_50.txt", sep = "\t", quote = F,row.names = F)
