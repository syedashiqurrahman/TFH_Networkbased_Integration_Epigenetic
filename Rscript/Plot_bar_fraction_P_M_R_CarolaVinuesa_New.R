
rm(list = ls())
cat("\014")

library(ggplot2)
library(readxl)

setwd("/Users/sar210/Box/TFH/clusters/EBSeqMulti/cluster_anno/scores/combined/elucidata/")

# all pattern
DF <- read_excel("CarolaVinuesa_DF.xlsx", 5)
DF$Type <- factor(DF$Type, levels = DF$Type)
DF$pathway <- factor(DF$pathway, levels = DF$pathway)
DF$pathway <- as.factor(DF$pathway)
DF$Type <- as.factor(DF$Type)

p<- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", position=position_dodge(), width = 0.25) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2, position=position_dodge(.9)) 
print(p)

# p + labs(title="", x= " ", y = "fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")+
#   theme_classic() + theme(legend.position="none") + scale_fill_manual(values=c('#0072bd','#00c300','#d155ff','#d155ff','#d155ff','#d155ff','#d1cdd1'))+ scale_x_discrete(limits = c("Module genes","Top significant genes","atac","k4me1","k4me3","k27ac","Random genes"))
p + theme(axis.text.x = element_text(angle = -90, hjust = 0), legend.position = "None") + xlab("") + ylab("fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")
# ggsave("plot_fraction_CarolaVinuesa_Vs_others.pdf")



test <- prop.test(x = c(18, 12), n = c(44, 44), alternative = "greater")
test$p.value
# 0.13
test <- prop.test(x = c(12, 8), n = c(44, 44), alternative = "greater")
test$p.value
# 0.22
test <- prop.test(x = c(18, 8), n = c(44, 44), alternative = "greater")
test$p.value
# 0.018



DF <- read_excel("CarolaVinuesa_DF.xlsx", 6)
DF$Type <- factor(DF$Type, levels = DF$Type)
DF$pathway <- factor(DF$pathway, levels = DF$pathway)
DF$pathway <- as.factor(DF$pathway)
DF$Type <- as.factor(DF$Type)

p<- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", position=position_dodge(), width = 0.25) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.1, position=position_dodge(.9)) 
print(p)

# p + labs(title="", x= " ", y = "fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")+
#   theme_classic() + theme(legend.position="none") + scale_fill_manual(values=c('#0072bd','#00c300','#d155ff','#d1cdd1'))+ scale_x_discrete(limits = c("Module genes","Top significant genes","Top transcriptomic genes","Random size-matched"))
p + theme(axis.text.x = element_text(angle = -90, hjust = 0), legend.position = "None") + xlab("") + ylab("fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")
# ggsave("plot_fraction_CarolaVinuesa_Vs_logFC_transcriptomic.pdf")


# only pattern 1122 and 1234
DF <- read_excel("CarolaVinuesa_DF.xlsx", 7)
DF$Type <- factor(DF$Type, levels = DF$Type)
DF$pathway <- factor(DF$pathway, levels = DF$pathway)
DF$pathway <- as.factor(DF$pathway)
DF$Type <- as.factor(DF$Type)

p<- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", position=position_dodge(), width = 0.25) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2, position=position_dodge(.9)) 
print(p)

# p + labs(title="", x= " ", y = "fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")+
#   theme_classic() + theme(legend.position="none") + scale_fill_manual(values=c('#0072bd','#00c300','#d155ff','#d155ff','#d155ff','#d155ff','#d1cdd1'))+ scale_x_discrete(limits = c("Module genes","Top significant genes","atac","k4me1","k4me3","k27ac","Random genes"))
p + theme(axis.text.x = element_text(angle = -90, hjust = 0), legend.position = "None") + xlab("") + ylab("fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")
# ggsave("plot_fraction_CarolaVinuesa_Vs_others_pattern1122_1234.pdf")


# all pattern new
DF <- read_excel("CarolaVinuesa_DF.xlsx", 8)
DF$Type <- factor(DF$Type, levels = DF$Type)
DF$pathway <- factor(DF$pathway, levels = DF$pathway)
DF$pathway <- as.factor(DF$pathway)
DF$Type <- as.factor(DF$Type)

p<- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", position=position_dodge(), width = 0.25) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2, position=position_dodge(.9)) 
print(p)

# p + labs(title="", x= " ", y = "fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")+
#   theme_classic() + theme(legend.position="none") + scale_fill_manual(values=c('#0072bd','#00c300','#d155ff','#d155ff','#d155ff','#d155ff','#d1cdd1'))+ scale_x_discrete(limits = c("Module genes","Top significant genes","atac","k4me1","k4me3","k27ac","Random genes"))
p + theme(axis.text.x = element_text(angle = -90, hjust = 0), legend.position = "None") + xlab("") + ylab("fraction of known drivers of Tfh differentiation \n that functionally interacts with gene set of interest")
# ggsave("plot_fraction_CarolaVinuesa_Vs_others_All_updated.pdf")

