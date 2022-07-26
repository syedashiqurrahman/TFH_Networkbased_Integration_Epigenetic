
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

# CV <- read.delim("/Users/sar210/Library/CloudStorage/Box-Box/TFH/CarolaVinuesa_signallingPathway.txt")
# CV <- CV$Genes

pattern1122 <- read_excel("/Users/sar210/Library/CloudStorage/Box-Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/Pattern1122_1234_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 1)
s1_pattern1122 <- pattern1122[, c(1,2)]
s2_pattern1122 <- pattern1122[, c(1,3)]
s3_pattern1122 <- pattern1122[, c(1,4)]
s4_pattern1122 <- pattern1122[, c(1,5)]
write.table(s1_pattern1122, file = "score_pattern1122_S1.txt", sep = "\t", quote = F,row.names = F)
write.table(s2_pattern1122, file = "score_pattern1122_S2.txt", sep = "\t", quote = F,row.names = F)
write.table(s3_pattern1122, file = "score_pattern1122_S3.txt", sep = "\t", quote = F,row.names = F)
write.table(s4_pattern1122, file = "score_pattern1122_S4.txt", sep = "\t", quote = F,row.names = F)

pattern1234 <- read_excel("/Users/sar210/Library/CloudStorage/Box-Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/Pattern1122_1234_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 2)
s1_pattern1234 <- pattern1234[, c(1,2)]
s2_pattern1234 <- pattern1234[, c(1,3)]
s3_pattern1234 <- pattern1234[, c(1,4)]
s4_pattern1234 <- pattern1234[, c(1,5)]
write.table(s1_pattern1234, file = "score_pattern1234_S1.txt", sep = "\t", quote = F,row.names = F)
write.table(s2_pattern1234, file = "score_pattern1234_S2.txt", sep = "\t", quote = F,row.names = F)
write.table(s3_pattern1234, file = "score_pattern1234_S3.txt", sep = "\t", quote = F,row.names = F)
write.table(s4_pattern1234, file = "score_pattern1234_S4.txt", sep = "\t", quote = F,row.names = F)


