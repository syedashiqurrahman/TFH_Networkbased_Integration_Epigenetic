
rm(list = ls())
cat("\014")

library(ggplot2)
library(matrixStats)
library(ggedit)
library(grid)
library(gridExtra)
library(gtools)
library(readxl)

setwd("/Users/sar210/Box/TFH/feature_matrices/")

# t-SNE
dF <- read_excel("Plot_ATACseq_PCA_tSNE_NMF_MDS.xlsx", 2)
dF$Stage <- as.factor(dF$Stage)
p1 <- ggplot(dF, aes(x=PC1, y=PC2, colour = Stage)) + geom_point() 
# p1 <- p1 + theme_classic() + xlab("tSNE1") + ylab("tSNE2")+ theme(legend.position="right") + ggtitle("tSNE") + theme(plot.title = element_text(hjust = 0.5))
p1 <- p1 + theme_classic() + xlab("tSNE1") + ylab("tSNE2")+ theme(legend.position="none") + ggtitle("tSNE") + theme(plot.title = element_text(hjust = 0.5))
# ggsave("ATACseq_MW_tSNE.pdf")

# t-SNE
dF <- read_excel("Plot_CutnRun_PCA_tSNE_NMF_MDS.xlsx", 2)
dF$Stage <- as.factor(dF$Stage)
p2 <- ggplot(dF, aes(x=PC1, y=PC2, colour = Stage)) + geom_point() 
p2 <- p2 + theme_classic() + xlab("tSNE1") + ylab("tSNE2")+ theme(legend.position="none") + ggtitle("tSNE") + theme(plot.title = element_text(hjust = 0.5))
# ggsave("K4me1_MW_tSNE.pdf")


dF <- read_excel("Plot_CutnRun_PCA_tSNE_NMF_MDS.xlsx", 6)
dF$Stage <- as.factor(dF$Stage)
p3 <- ggplot(dF, aes(x=PC1, y=PC2, colour = Stage)) + geom_point() 
p3 <- p3 + theme_classic() + xlab("tSNE1") + ylab("tSNE2")+ theme(legend.position="none") + ggtitle("tSNE") + theme(plot.title = element_text(hjust = 0.5))
# ggsave("K4me3_MW_tSNE.pdf")


dF <- read_excel("Plot_CutnRun_PCA_tSNE_NMF_MDS.xlsx", 10)
dF$Stage <- as.factor(dF$Stage)
p4 <- ggplot(dF, aes(x=PC1, y=PC2, colour = Stage)) + geom_point() 
p4 <- p4 + theme_classic() + xlab("tSNE1") + ylab("tSNE2")+ theme(legend.position="none") + ggtitle("tSNE") + theme(plot.title = element_text(hjust = 0.5))
# ggsave("K27Ac_MW_tSNE.pdf")

p5 <- grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2)

pdf("ATACseq_CutNrun_tSNE.pdf", width = 8, height = 6) # Open a new pdf file
p5 <- grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2)
dev.off() # Close the file



