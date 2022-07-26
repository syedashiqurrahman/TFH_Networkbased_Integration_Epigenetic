
rm(list = ls())
cat("\014")

library(e1071)
library(randomForest)
library(tree)
library(gbm)
library(matrixStats)
library(readxl)
library(cvAUC)
library(tidyverse) 

setwd("/Users/sar210/Box/TFH/feature_matrices/")
# setwd("/Users/syedashiqurrahman/Box/TFH/feature_matrices/")

# Dataset <- read.csv("rnaseq.Run_313.atac-seq-correl.rsem.pe.hg38.ensembl.counts.matrix.csv")
# Dataset <- read.csv("atac.unionIntervals.sorted.qc.read_counts_matrix.csv")

df <- read.csv("atac.unionIntervals.sorted.qc.read_counts_matrix.csv")

# df <- read.csv("cnr.K4me1.TFH.counts.matrix.csv")
# df <- read.csv("cnr.K4me3.TFH.counts.matrix.csv")
# df <- read.csv("cnr.K27Ac.TFH.counts.matrix.csv")


# Dataset <- df[ -grep("alt", df[,1]), ]
# Dataset <- Dataset[ -grep("random", Dataset[,1]), ]
# Dataset <- Dataset[ -grep("chrUn", Dataset[,1]), ]


# Dataset <- df[, -grep("alt", colnames(df))]
# Dataset <- df %>% select(-contains("alt"))

Dataset <- df
GeneNames <- Dataset[,1]
Dataset <- Dataset[, -1]

td <- data.frame(t(Dataset))
# td <- td[-1, ]
data <- td
Y <- td[,1]

# limit <- 0.50 * nrow(data)
# data <- data[, which(apply(data, 2, function(col) !any(table(col) > limit)))] 

# scaledData <- data.frame(scale(data))

## Rescale each column to range between 0 and 1
scaledData <- data.frame(apply(data, MARGIN = 2, FUN = function(X) (X - min(X))/diff(range(X))))

X <- scaledData[, -1]

# Mann whitney
# i <- 2
MW12 <- c()
MW13 <- c()
MW14 <- c()
MW23 <- c()
MW24 <- c()
MW34 <- c()

g1 <- X[1:4, ]
Y1 <- c(1,1,1,1)
g2 <- X[5:8, ]
Y2 <- c(2,2,2,2)
g3 <- X[9:12, ]
Y3 <- c(3,3,3,3)
g4 <- X[13:16, ]
Y4 <- c(4,4,4,4)

g12 <- rbind(g1,g2)
Y12 <- c(Y1,Y2)
g13 <- rbind(g1,g3)
Y13 <- c(Y1,Y3)
g14 <- rbind(g1,g4)
Y14 <- c(Y1,Y4)

g23 <- rbind(g2,g3)
Y23 <- c(Y2,Y3)
g24 <- rbind(g2,g4)
Y24 <- c(Y2,Y4)

g34 <- rbind(g3,g4)
Y34 <- c(Y3,Y4)

for (i in 1:ncol(X))
{
  mwg12 <- wilcox.test(g12[,i] ~ Y12)
  MW12[i] <- mwg12$p.value
  mwg13 <- wilcox.test(g13[,i] ~ Y13)
  MW13[i] <- mwg13$p.value
  mwg14 <- wilcox.test(g14[,i] ~ Y14)
  MW14[i] <- mwg14$p.value
  
  mwg23 <- wilcox.test(g23[,i] ~ Y23)
  MW23[i] <- mwg23$p.value
  mwg24 <- wilcox.test(g24[,i] ~ Y24)
  MW24[i] <- mwg24$p.value
  
  mwg34 <- wilcox.test(g34[,i] ~ Y34)
  MW34[i] <- mwg34$p.value
}
newX <- rbind.data.frame(MW12, MW13, MW14, MW23, MW24, MW34, X)

sorted12 <- newX[, order(newX[1,]) ]
sorted13 <- newX[, order(newX[2,]) ]
sorted14 <- newX[, order(newX[3,]) ]
sorted23 <- newX[, order(newX[4,]) ]
sorted24 <- newX[, order(newX[5,]) ]
sorted34 <- newX[, order(newX[6,]) ]

sorted12 <- sorted12[-c(2:6),]
sorted13 <- sorted13[-c(1,3:6),]
sorted14 <- sorted14[-c(1,2,4:6),]
sorted23 <- sorted23[-c(1:3,5,6),]
sorted24 <- sorted24[-c(1:4,6),]
sorted34 <- sorted34[-c(1:5),]

# N = 50
# N = 200
# N = 400
N = 800

sorted12 <- sorted12[, c(1:N)]
sorted13 <- sorted13[, c(1:N)]
sorted14 <- sorted14[, c(1:N)]
sorted23 <- sorted23[, c(1:N)]
sorted24 <- sorted24[, c(1:N)]
sorted34 <- sorted34[, c(1:N)]

Y <- c(0, Y)
sorted12 <- cbind(Y, sorted12)
sorted13 <- cbind(Y, sorted13)
sorted14 <- cbind(Y, sorted14)
sorted23 <- cbind(Y, sorted23)
sorted24 <- cbind(Y, sorted24)
sorted34 <- cbind(Y, sorted34)


# write.csv(sorted12, "ATACseq_EBseqPatternXXXX.csv")

# write.csv(sorted12, "K4me1_CutnRun_EBseqPatternXXXX.csv")

# write.csv(sorted12, "K4me3_CutnRun_EBseqPatternXXXX.csv")
 
# write.csv(sorted12, "K27Ac_CutnRun_EBseqPatternXXXX.csv")


