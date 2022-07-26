
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/elucidata/")

library(matrixStats)
library(readxl)
library(xlsx)

data <- read_excel("Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 1)
S4 <- data[4,]
S2 <- data[2,]
fc <- log2(S4/S2)
# fc[, is.na(fc[1,]) ] <- 0.0001
# fc[, is.na(fc[1,]) ] <- NaN
fc[, which(fc[1,] == -Inf)] <- -6.13
fc[, which(fc[1,] == Inf)] <-5.8
fc <- t(fc)
# write.table(fc, file = "TFH_RNAseq_1122_1234_Carola_Vinuesa_fc_Node_Attribute.txt", sep = "\t", row.names = T, quote = FALSE)


data <- read_excel("Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 2)
S4 <- data[4,]
S2 <- data[2,]
fc <- log2(S4/S2)
# fc[, is.na(fc[1,]) ] <- NaN
fc[, which(fc[1,] == -Inf)] <- -6.13
fc[, which(fc[1,] == Inf)] <-5.8
fc <- t(fc)
write.table(fc, file ="TFH_RNAseq_1122_1234_IL6_JAK_STAT_fc_Node_Attribute.txt", sep = "\t", row.names = T, quote = FALSE)


data <- read_excel("Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 3)
S4 <- data[4,]
S2 <- data[2,]
fc <- log2(S4/S2)
# fc[, is.na(fc[1,]) ] <- NaN
fc[, which(fc[1,] == -Inf)] <- -6.13
fc[, which(fc[1,] == Inf)] <-5.8
fc <- t(fc)
write.table(fc, file = "TFH_RNAseq_1122_1234_KEGG_JAK_STAT_fc_Node_Attribute.txt", sep = "\t", row.names = T, quote = FALSE)


data <- read_excel("Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 4)
S4 <- data[4,]
S2 <- data[2,]
fc <- log2(S4/S2)
# fc[, is.na(fc[1,]) ] <- NaN
fc[, which(fc[1,] == -Inf)] <- -6.13
fc[, which(fc[1,] == Inf)] <-5.8
fc <- t(fc)
write.table(fc, file = "TFH_RNAseq_1122_1234_KEGG_CYTOKINE_CYTOKINE_fc_Node_Attribute.txt", sep = "\t", row.names = T, quote = FALSE)


data <- read_excel("Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 5)
S4 <- data[4,]
S2 <- data[2,]
fc <- log2(S4/S2)
# fc[, is.na(fc[1,]) ] <- NaN
fc[, which(fc[1,] == -Inf)] <- -6.13
fc[, which(fc[1,] == Inf)] <-5.8
fc <- t(fc)
write.table(fc, file = "TFH_RNAseq_1122_1234_PID_IL12_STAT4_fc_Node_Attribute.txt", sep = "\t", row.names = T, quote = FALSE)


data <- read_excel("Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 6)
S4 <- data[4,]
S2 <- data[2,]
fc <- log2(S4/S2)
# fc[, is.na(fc[1,]) ] <- NaN
fc[, which(fc[1,] == -Inf)] <- -6.13
fc[, which(fc[1,] == Inf)] <-5.8
fc <- t(fc)
write.table(fc, file = "TFH_RNAseq_1122_1234_PID_INTEGRIN_CS_fc_Node_Attribute.txt", sep = "\t", row.names = T, quote = FALSE)


