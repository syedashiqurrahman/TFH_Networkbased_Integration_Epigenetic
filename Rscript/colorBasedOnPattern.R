
rm(list = ls())
cat("\014")

# setwd("/Users/sar210/Box/TFH/feature_matrices/")
setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/")

library(matrixStats)
library(readxl)
library(stringr)
library(dplyr) 

# atac <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/atac.scores25kb.txt")
# k4me1 <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/k4me1.scores25kb.txt")
# k4me3 <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/k4me3.scores25kb.txt")
# k27ac <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/k27ac.scores25kb.txt")

atac <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/atac.scores250kb.txt")
k4me1 <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/k4me1.scores250kb.txt")
k4me3 <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/k4me3.scores250kb.txt")
k27ac <- read.delim("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/k27ac.scores250kb.txt")


# atac_Pattern_1122 <- subset(atac, PatternDef == 1122)
# k4me1_Pattern_1122 <- subset(k4me1, PatternDef == 1122)
# k4me3_Pattern_1122 <- subset(k4me3, PatternDef == 1122)
# k27ac_Pattern_1122 <- subset(k27ac, PatternDef == 1122)

pattern1122_1234_CV <- read_excel("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/elucidata/Pattern1122_1234_N_Pathway_Genes_RNAseq_Summary_S1_S2_S3_S4.xlsx", 1)
Genes_Pattern1122_1234_CV <- names(pattern1122_1234_CV)
Genes_Pattern1122_1234_CV <- setdiff(Genes_Pattern1122_1234_CV, "Y")

Genes_Pattern1122_1234_CV_atac <- subset(atac, gene %in% Genes_Pattern1122_1234_CV)
Genes_Pattern1122_1234_CV_k4me1 <- subset(k4me1, gene %in% Genes_Pattern1122_1234_CV)
Genes_Pattern1122_1234_CV_k4me3 <- subset(k4me3, gene %in% Genes_Pattern1122_1234_CV)
Genes_Pattern1122_1234_CV_k27ac <- subset(k27ac, gene %in% Genes_Pattern1122_1234_CV)


patternColor <- Genes_Pattern1122_1234_CV_atac$PatternDef
col1 <- which(patternColor == 1234)
col2 <- which(patternColor == 1122)
col3 <- which(patternColor != 1234 & patternColor != 1122)
patternColor[col1] <- 1
patternColor[col2] <- 2
patternColor[col3] <- 3
Genes_Pattern1122_1234_CV_atac$patternColor <- patternColor
Genes_Pattern1122_1234_CV_atac <- Genes_Pattern1122_1234_CV_atac[,c(1,4)]
# keep the score with minimum
Genes_Pattern1122_1234_CV_atac <- Genes_Pattern1122_1234_CV_atac %>% 
                                    group_by(gene) %>% 
                                    slice(which.min(patternColor))

write.table(Genes_Pattern1122_1234_CV_atac, file = "atac_1122_1234_CV_Node_Attribute_patternColor.txt", sep = "\t", row.names = F, quote = FALSE)

patternColor <- Genes_Pattern1122_1234_CV_k4me1$PatternDef
col1 <- which(patternColor == 1234)
col2 <- which(patternColor == 1122)
col3 <- which(patternColor != 1234 & patternColor != 1122)
patternColor[col1] <- 1
patternColor[col2] <- 2
patternColor[col3] <- 3
Genes_Pattern1122_1234_CV_k4me1$patternColor <- patternColor
Genes_Pattern1122_1234_CV_k4me1 <- Genes_Pattern1122_1234_CV_k4me1[, c(1,4)]
Genes_Pattern1122_1234_CV_k4me1 <- Genes_Pattern1122_1234_CV_k4me1 %>% 
                                    group_by(gene) %>% 
                                    slice(which.min(patternColor))
write.table(Genes_Pattern1122_1234_CV_k4me1, file = "k4me1_1122_1234_CV_Node_Attribute_patternColor.txt", sep = "\t", row.names = F, quote = FALSE)

patternColor <- Genes_Pattern1122_1234_CV_k4me3$PatternDef
col1 <- which(patternColor == 1234)
col2 <- which(patternColor == 1122)
col3 <- which(patternColor != 1234 & patternColor != 1122)
patternColor[col1] <- 1
patternColor[col2] <- 2
patternColor[col3] <- 3
Genes_Pattern1122_1234_CV_k4me3$patternColor <- patternColor
Genes_Pattern1122_1234_CV_k4me3 <- Genes_Pattern1122_1234_CV_k4me3[, c(1,4)]
Genes_Pattern1122_1234_CV_k4me3 <- Genes_Pattern1122_1234_CV_k4me3 %>% 
                                    group_by(gene) %>% 
                                    slice(which.min(patternColor))
write.table(Genes_Pattern1122_1234_CV_k4me3, file = "k4me3_1122_1234_CV_Node_Attribute_patternColor.txt", sep = "\t", row.names = F, quote = FALSE)

patternColor <- Genes_Pattern1122_1234_CV_k27ac$PatternDef
col1 <- which(patternColor == 1234)
col2 <- which(patternColor == 1122)
col3 <- which(patternColor != 1234 & patternColor != 1122)
patternColor[col1] <- 1
patternColor[col2] <- 2
patternColor[col3] <- 3
Genes_Pattern1122_1234_CV_k27ac$patternColor <- patternColor
Genes_Pattern1122_1234_CV_k27ac <- Genes_Pattern1122_1234_CV_k27ac[, c(1,4)]
Genes_Pattern1122_1234_CV_k27ac <- Genes_Pattern1122_1234_CV_k27ac %>% 
                                    group_by(gene) %>% 
                                    slice(which.min(patternColor))
write.table(Genes_Pattern1122_1234_CV_k27ac, file = "k27ac_1122_1234_CV_Node_Attribute_patternColor.txt", sep = "\t", row.names = F, quote = FALSE)


