
rm(list = ls())
cat("\014")

# setwd("/Users/sar210/Box/TFH/feature_matrices/")
setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/")

library(matrixStats)
library(readxl)
library(stringr)
library(dplyr) 


pattern1122 <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/Pattern_1122_Genes_Scores.txt")
pattern1234 <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/Pattern_1234_Genes_Scores.txt")

pattern1122_1234_CV <- read_excel("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/elucidata/Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 1)
Genes_Pattern1122_1234_CV <- names(pattern1122_1234_CV)
Genes_Pattern1122_1234_CV <- setdiff(Genes_Pattern1122_1234_CV, "Y")


subPattern1122 <- subset(pattern1122, gene %in% Genes_Pattern1122_1234_CV)
subPattern1234 <- subset(pattern1234, gene %in% Genes_Pattern1122_1234_CV)

subPattern1122_1234 <- rbind(subPattern1234, subPattern1122)

subPattern1122_1234 <- subPattern1122_1234 %>%
                                    group_by(gene) %>%
                                    slice(which.max(score))

subPattern1122_1234$score <- log2(subPattern1122_1234$score)
write.table(subPattern1122_1234, file = "1122_1234_CV_Node_Attribute_GeneScore.txt", sep = "\t", row.names = F, quote = FALSE)

# sharedGene <- intersect(subPattern1122$gene, subPattern1234$gene)
# "PPARG","SPTB","UBA52","HDAC5","LDLRAD4","BATF","CIITA","CUX1","FOXO1","NR2E3","PDCD1"


# patternColor <- Genes_Pattern1122_1234_CV_atac$PatternDef
# col1 <- which(patternColor == 1122)
# col2 <- which(patternColor == 1234)
# col3 <- which(patternColor != 1234 & patternColor != 1122)
# patternColor[col1] <- 1
# patternColor[col2] <- 2
# patternColor[col3] <- 3
# Genes_Pattern1122_1234_CV_atac$patternColor <- patternColor
# Genes_Pattern1122_1234_CV_atac <- Genes_Pattern1122_1234_CV_atac[,c(1,4)]
# # keep the score with minimum
# Genes_Pattern1122_1234_CV_atac <- Genes_Pattern1122_1234_CV_atac %>% 
#                                     group_by(gene) %>% 
#                                     slice(which.min(patternColor))
# 
# write.table(Genes_Pattern1122_1234_CV_atac, file = "atac_1122_1234_CV_Node_Attribute_patternColor.txt", sep = "\t", row.names = F, quote = FALSE)



