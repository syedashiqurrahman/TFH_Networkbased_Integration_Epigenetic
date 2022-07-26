
rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/")

library(matrixStats)
library(readxl)
library(stringr)
library(ggplot2)
library(dplyr)


data <- read_excel("fisherExact_Hallmark.xlsx", 4)
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

# fc <- log2(df$V2/df$V1)
P <- pVAL
# FDR <- p.adjust(P, method = "fdr", n = length(P))
logP <- -1*log10(P)

pathwayName <- read_excel("results_hallmark_Updated.xlsx", 4)
pathwayName <- pathwayName[-c(1,52:55),1]
names(pathwayName) <- "pathwayName"

plotDF <- cbind.data.frame(pathwayName, fc, P, logP)
plotDF <- na.omit(plotDF)
volcano = ggplot(data = plotDF, aes(x = fc, y = logP))
volcano + geom_point() + xlab("log2fc") + ylab("-log10(P)") + xlim(-2,2) + ggtitle("pathway vs random") +
  theme(plot.title = element_text(hjust = 0.5))

sortedDF <- plotDF[order(-plotDF[,4]),]
# featuresPassingCriteria <- subset(plotDF, abs(fc) > log2(1.5) & logP > 3)


# featuresPassingCriteria <- subset(plotDF, (fc < -log2(1.5)) & logP > 3)

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
  # xlim(c(-2, 2)) +
  xlim(c(-1.5, 1.5)) +
  ylim(c(0, 2.5)) +
  # scale_color_manual(name = "Threshold",
  #                    values = c("cond1" = "blue", "cond2" = "green", "cond3" = "black"))
  scale_color_manual(name = "Threshold",
                     values = c("cond1" = "blue", "cond2" = "black", "cond3" = "black"))
# volcano + theme_classic() + theme(legend.position="None") +  annotate("text", x = c(-1,1), y = c(6,6), size = 5, label = c("Lower in Pathway","Higher in Pathway"))

volcano + theme_classic() + theme(legend.position="None") + annotate("text", x = c(1), y = c(2.4), size = 3, label = c("IL6_JAK_STAT3_SIGNALING"), color = "blue", fontface = 2)

# ggsave("volcano_Pattern_1122_1234_Vs_Hallmark_Pathways.pdf")








rm(list = ls())
cat("\014")

setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/")

library(matrixStats)
library(readxl)
library(stringr)
library(ggplot2)
library(dplyr)

data <- read_excel("fisherExact_Hallmark.xlsx", 4)
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

pathwayName <- read_excel("results_hallmark_Updated.xlsx", 4)
pathwayName <- pathwayName[-c(1,52:55),1]
names(pathwayName) <- "pathwayName"

plotDF <- cbind.data.frame(pathwayName, fc, P, logP)
plotDF <- na.omit(plotDF)
volcano = ggplot(data = plotDF, aes(x = fc, y = logP))
volcano + geom_point() + xlab("log2fc") + ylab("-log10(P)") + xlim(-2,2) + ggtitle("pathway vs random") +
  theme(plot.title = element_text(hjust = 0.5))

sortedDF <- plotDF[order(-plotDF[,4]),]
# featuresPassingCriteria <- subset(plotDF, abs(fc) > log2(1.5) & logP > 3)


# featuresPassingCriteria <- subset(plotDF, (fc < -log2(1.5)) & logP > 3)

myDiff1p <- plotDF

myDiff1p <- myDiff1p %>%
  mutate(threshold = factor(case_when(fc > 0.58 & logP > 1 ~ "cond1",
                                      fc < -0.58 & logP > 1 ~ "cond2",
                                      TRUE ~ "cond3")))

volcano <-  ggplot(data=myDiff1p, aes(x = fc, y = logP)) + 
  geom_point(aes(color = threshold), alpha=1, size = 1.75)+ 
  # geom_vline(xintercept=c(-0.58, 0.58), color="red", alpha=0.3)+
  # geom_hline(yintercept= 2, color="blue", alpha=0.5)+
  xlab("log2_odds_ratio")+ 
  ylab("-log(P)")+ 
  theme_classic()+
  xlim(c(-2, 2)) +
  ylim(c(0, 2)) +
  scale_color_manual(name = "Threshold",
                     values = c("cond1" = "blue", "cond2" = "black", "cond3" = "black"))

# volcano + theme_classic() + theme(legend.position="None") +  annotate("text", x = c(-1,1), y = c(6,6), size = 5, label = c("Lower in Pathway","Higher in Pathway"))

# volcano + theme_classic() + theme(legend.position="None") + annotate("text", x = c(1.3), y = c(2.4), size = 3, label = c(""))
volcano + theme_classic() + theme(legend.position="None") + annotate("text", x = c(1, 0.8), y = c(1.9, 1.6), size = 3, label = c("IL6_JAK_STAT3_SIGNALING", "ALLOGRAFT_REJECTION"), color = "blue", fontface = 2)

# ggsave("volcano_Pattern_1122_1234_Vs_Hallmark_ModuleSpace.pdf")




# data <- read_excel("results_hallmark_Updated.xlsx", 4)
# # data <- data[ , -c()]
# 
# df <- data[-c(1,52:55), -1]
# 
# names(df) <- c("pathway", "numberOfGenes", "pathway", "pathwayRandom", "pathPval", "module", "moduleRandom", "modulePval")
# 
# # severe <- subset(df, Y == 1)
# # mild <- subset(df, Y == 0)
# # df <- newDF
# # normosmic <- subset(df, Anosmia >= 12)
# # anoHyposmic <- subset(df, Anosmia < 12)
# # normosmicMe = apply(normosmic, 2, median)
# # anoHyposmicMe = apply(anoHyposmic, 2, median) 
# 
# fc <- log2(normosmicMe/anoHyposmicMe)
# 
# logP <- c()
# P <- c()
# for (i in 2:ncol(df))
# { 
#   results<- wilcox.test(normosmic[,i], anoHyposmic[,i])
#   P[i] <- (results$p.value)
#   logP[i] <- -1*log10(results$p.value)
# }
# # rawpvalue <- c(0, rawpvalue)
# plotDF <- cbind.data.frame(fc, P, logP)
# plotDF <- plotDF[-c(1,2),]
# # write.csv(plotDF, "All_ratios_log2fc_vs_logP.csv")
# 
# volcano = ggplot(data = plotDF, aes(x = fc, y = logP))
# volcano + geom_point() + xlab("log2fc") + ylab("-log10(P)") + xlim(-6,6) + ggtitle("all normosmic vs ano-hyposmic using ratios") +
#   theme(plot.title = element_text(hjust = 0.5))
# # ggsave("All_ratios_log2fc_vs_logP.pdf")






