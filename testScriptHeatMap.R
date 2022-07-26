
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/feature_matrices/")


library(stringr)
library(matrixStats)
library(readxl)
library(ggplot2)
library(ggcorrplot)
library(RColorBrewer)
library(pheatmap)


# coul <- colorRampPalette(brewer.pal(8, "PiYG"))(20)

# K4me1.clusters
df <- read.delim("/Users/sar210/Box/TFH/heatmaps/K4me1.clusters_sig.txt", header = T)
tempDF <- df
# pheatmap(as.matrix(scale(tempDF)))
tempDF %>% pheatmap(cluster_cols = F, show_rownames = F, scale="row")


# K4me3.clusters
df <- read.delim("/Users/sar210/Box/TFH/heatmaps/K4me3.clusters_sig.txt", header = T)
tempDF <- df
# pheatmap(as.matrix(scale(tempDF)))
tempDF %>% pheatmap(cluster_cols = F, show_rownames = F, scale="row")


# K27ac.clusters
df <- read.delim("/Users/sar210/Box/TFH/heatmaps/K27ac.clusters_sig.txt", header = T)
tempDF <- df
# pheatmap(as.matrix(scale(tempDF)))
tempDF %>% pheatmap(cluster_cols = F, show_rownames = F, scale="row")


# ATAC.clusters
df <- read.delim("/Users/sar210/Box/TFH/heatmaps/atac.clusters_sig.txt", header = T)
tempDF <- df
# pheatmap(as.matrix(scale(tempDF)))
tempDF %>% pheatmap(cluster_cols = F, show_rownames = F, scale="row")

atac.clusters.sig %>% pheatmap(cluster_cols = F,show_rownames = F,scale="row")


# RNAseq Clusters ??
df <- read.delim("/Users/sar210/Box/TFH/feature_matrices/rnaseq.Run_313.atac-seq-correl.rsem.pe.hg38.ensembl.counts.matrix.txt", header = T)
tempDF <- df
tempDF <- na.omit(tempDF)
# pheatmap(as.matrix(scale(tempDF)))
tempDF %>% pheatmap(cluster_cols = F, show_rownames = F, scale="row")



# RNAseq Clusters ??
df <- read.csv("/Users/sar210/Box/TFH/heatmaps/rnaseq.csv")

tempDF <- subset(df, PPDE >= 0.95)
tempDF <- tempDF[, c(8:23)]
tempDF <- na.omit(tempDF)
# pheatmap(as.matrix(scale(tempDF)))
tempDF %>% pheatmap(cluster_cols = F, show_rownames = F, scale="row")



# # ATAC
# # df <- read.delim("atac.unionIntervals.sorted.qc.read_counts_matrix.txt", header = F)
# 
# df <- read.csv("atac.unionIntervals.sorted.qc.read_counts_matrix.csv")
# tempDF <- df[c(1:20000),-1]
# 
# tempDF <- scale(tempDF)
# pheatmap(as.matrix(tempDF))
# 
# pheatmap(as.matrix(scale(tempDF[,-1])),  main = "", cluster_cols = F)
# 
# pheatmap(as.matrix(scale(tempDF[,-1])),  main = "", color = colorRampPalette(rev(brewer.pal(n = 11, name ="PiYG")))(100), cluster_rows = F)





