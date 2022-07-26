 
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/")

library(matrixStats)
library(readxl)
library(stringr)
library(ggplot2)
library(dplyr)

data <- read_excel("fisherExact_C2_PID.xlsx", 4)
pVAL <- c()
for(i in 1:nrow(data)){
  # test <- prop.test(x = c(data$V1[i], data$V2[i]), n = c(data$Genes[i], data$Genes[i]), alternative = "greater")
  test <- prop.test(x = c(data$V1[i], data$V2[i]), n = c(data$Genes[i], data$Genes[i]))
  pVAL[i] <- test$p.value
}

df <- data[, c(1,2,3)]
df <- cbind.data.frame(df, pVAL)

# fc <- log2(df$V1/df$V2)
# fc <- log2((df$V1/df$Genes) /(df$V2/df$Genes))

df$V1 <- df$V1 + 0.0001
df$V2 <- df$V2 + 0.0001
f1 <- df$V1/df$Genes
f2 <- df$V2/df$Genes
oddsRatio <- (f1 /(1- f1)) / (f2 /(1 - f2))
fc <- log2(oddsRatio)

P <- pVAL
# FDR <- p.adjust(P, method = "fdr", n = length(P))
logP <- -1*log10(P)

pathwayName <- read_excel("results_PID_Updated.xlsx", 4)
pathwayName <- pathwayName[-c(1),1]
names(pathwayName) <- "pathwayName"

plotDF <- cbind.data.frame(pathwayName, fc, P, logP)
plotDF <- na.omit(plotDF)
volcano = ggplot(data = plotDF, aes(x = fc, y = logP))
volcano + geom_point() + xlab("log2_odds_ratio") + ylab("-log10(P)") + xlim(-2,2) + ggtitle("pathway vs random") +
  theme(plot.title = element_text(hjust = 0.5))

sortedDF <- plotDF[order(-plotDF[,4]),]
# featuresPassingCriteria <- subset(plotDF, abs(fc) > log2(1.5) & logP > 3)

myDiff1p <- plotDF

myDiff1p <- myDiff1p %>%
  mutate(threshold = factor(case_when(fc > 0.58 & logP > 2 ~ "cond1",
                                      fc < -0.58 & logP > 2 ~ "cond2",
                                      TRUE ~ "cond3")))

volcano <-  ggplot(data=myDiff1p, aes(x = fc, y = logP)) + 
  geom_point(aes(color = threshold), alpha=1, size = 1.75)+ 
  geom_vline(xintercept=c(-0.58, 0.58), color="red", alpha=0.3)+
  geom_hline(yintercept= 2, color="blue", alpha=0.5)+
  xlab("log2_odds_ratio")+ 
  ylab("-log(P)")+ 
  theme_classic()+
  xlim(c(-3, 3)) +
  ylim(c(0, 2.7)) +
  scale_color_manual(name = "Threshold",
                     values = c("cond1" = "blue", "cond2" = "black", "cond3" = "black"))

# volcano + theme_classic() + theme(legend.position="None") +  annotate("text", x = c(-1,1), y = c(6,6), size = 5, label = c("Lower in Pathway","Higher in Pathway"))

volcano + theme_classic() + theme(legend.position="None") + annotate("text", x = c(2, 2), y = c(2.6, 2.25), size = 3, label = c("IL12_STAT4_PATHWAY", "INTEGRIN_CS_PATHWAY"), color = "blue", fontface = 2)

ggsave("volcano_Pattern_1122_1234_Vs_PID_Pathways.pdf")




rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/")

data <- read_excel("fisherExact_C2_PID.xlsx", 4)
pVAL <- c()
numOfModuleGene <- 192
for(i in 1:nrow(data)){
  # test <- prop.test(x = c(data$V3[i], data$V4[i]), n = c(data$Genes[i], data$Genes[i]), alternative = "greater")
  test <- prop.test(x = c(data$V3[i], data$V4[i]), n = c(numOfModuleGene, numOfModuleGene))
  pVAL[i] <- test$p.value
}

df <- data[, c(1,4,5)]
df <- cbind.data.frame(df, pVAL)

# fc <- log2(df$V1/df$V2)
# fc <- log2((df$V1/df$Genes) /(df$V2/df$Genes))

df$V3 <- df$V3 + 0.0001
df$V4 <- df$V4 + 0.0001
f3 <- df$V3/numOfModuleGene
f4 <- df$V4/numOfModuleGene
oddsRatio <- (f3 /(1- f3)) / (f4 /(1 - f4))
fc <- log2(oddsRatio)

P <- pVAL
# FDR <- p.adjust(P, method = "fdr", n = length(P))
logP <- -1*log10(P)

pathwayName <- read_excel("results_PID_Updated.xlsx", 4)
pathwayName <- pathwayName[-c(1),1]
names(pathwayName) <- "pathwayName"

plotDF <- cbind.data.frame(pathwayName, fc, P, logP)
plotDF <- na.omit(plotDF)
volcano = ggplot(data = plotDF, aes(x = fc, y = logP))
volcano + geom_point() + xlab("log2_odds_ratio") + ylab("-log10(P)") + xlim(-2,2) + ggtitle("module vs random") +
  theme(plot.title = element_text(hjust = 0.5))

sortedDF <- plotDF[order(-plotDF[,4]),]
# featuresPassingCriteria <- subset(plotDF, abs(fc) > log2(1.5) & logP > 3)

myDiff1p <- plotDF

myDiff1p <- myDiff1p %>%
  mutate(threshold = factor(case_when(fc > 0.58 & logP > 1.9 ~ "cond1",
                                      fc < -0.58 & logP > 1.9 ~ "cond2",
                                      TRUE ~ "cond3")))

volcano <-  ggplot(data=myDiff1p, aes(x = fc, y = logP)) + 
  geom_point(aes(color = threshold), alpha=1, size = 1.75)+ 
  # geom_vline(xintercept=c(-0.58, 0.58), color="red", alpha=0.3)+
  # geom_hline(yintercept= 2, color="blue", alpha=0.5)+
  xlab("log2_odds_ratio")+ 
  ylab("-log(P)")+ 
  theme_classic()+
  xlim(c(-3, 3)) +
  ylim(c(0, 3)) +
  scale_color_manual(name = "Threshold",
                     values = c("cond1" = "blue", "cond2" = "black", "cond3" = "black"))

# volcano + theme_classic() + theme(legend.position="None") +  annotate("text", x = c(-1,1), y = c(6,6), size = 5, label = c("Lower in Pathway","Higher in Pathway"))

volcano + theme_classic() + theme(legend.position="None") + annotate("text", x = c(1.9, 1.3), y = c(2.72, 2.1), size = 3, label = c("IL12_STAT4_PATHWAY", "IL12_2PATHWAY"), color = "blue", fontface = 2)


ggsave("volcano_Pattern_1122_1234_Vs_PID_ModuleSpace.pdf")




