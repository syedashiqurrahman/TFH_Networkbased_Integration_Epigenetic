
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/heatmaps/")

library(stringr)
library(matrixStats)
library(readxl)
library(ggplot2)
library(ggcorrplot)
library(RColorBrewer)
library(pheatmap)

df1 <- read.delim("/Users/sar210/Box/TFH/heatmaps/Run_313.atac-seq-correl.rsem.pe.hg38.ensembl.counts.matrix.results.condmeans_patterns.txt", header = T)

df2 <- read.delim("/Users/sar210/Box/TFH/heatmaps/Run_313.atac-seq-correl.rsem.pe.hg38.ensembl.counts.matrix.results.normalized_data_matrix.txt", header = T)

df <- merge(df1, df2, by= "ID")
write.csv(df, "RNAseq.csv")
tempDF <- df[,c(8:23)]
w
tempDF %>% pheatmap(cluster_cols = T, show_rownames = F, scale="row")
