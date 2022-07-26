
rm(list = ls())
cat("\014")

library(ggplot2)
library(readxl)

setwd("/Users/sar210/Box/TFH/")

DF <- read_excel("scleroderma_DF.xlsx", 3)

DF$Type <- as.factor(DF$Type)
p <- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2,
                position=position_dodge(.9))
print(p)
# Finished bar plot
# p + labs(title="", x= " ", y = "Fraction of correlated genes")+
#   theme_classic() + scale_fill_manual(values=c('#999999','#E69F00', 'black')) + ylim(0, 0.8)
ggsave("plot_fraction_fm_fp_fr_Scleroderma_0.50.pdf")

DF <- read_excel("scleroderma_DF.xlsx", 4)
DF$Type <- as.factor(DF$Type)
p <- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2,
                position=position_dodge(.9))
print(p)
# Finished bar plot
# p + labs(title="", x= " ", y = "Fraction of correlated genes")+
#   theme_classic() + scale_fill_manual(values=c('#999999','#E69F00', 'black')) + ylim(0, 0.8)
ggsave("plot_fraction_fm_fp_fr_Scleroderma_0.25.pdf")


DF <- read_excel("scleroderma_CD8Tcells.xlsx", 2)

DF$Type <- as.factor(DF$Type)
p <- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2,
                position=position_dodge(.9))
print(p)
# Finished bar plot
# p + labs(title="", x= " ", y = "Fraction of correlated genes")+
#   theme_classic() + scale_fill_manual(values=c('#999999','#E69F00', 'black')) + ylim(0, 0.8)
ggsave("plot_fraction_fm_fp_fr_Scleroderma_CD8Tcells_0.50.pdf")


DF <- read_excel("scleroderma_CD8Tcells.xlsx", 3)
DF$Type <- as.factor(DF$Type)
p <- ggplot(DF, aes(x=pathway, y=fraction, fill=Type)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=fraction, ymax=fraction+Error), width=.2,
                position=position_dodge(.9))
print(p)
# Finished bar plot
# p + labs(title="", x= " ", y = "Fraction of correlated genes")+
#   theme_classic() + scale_fill_manual(values=c('#999999','#E69F00', 'black')) + ylim(0, 0.8)
ggsave("plot_fraction_fm_fp_fr_Scleroderma_CD8Tcells_0.25.pdf")

