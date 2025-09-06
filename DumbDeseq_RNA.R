library(readr)
DumbDeseq_data <- read_csv("DumbDeseq_data.csv")
View(DumbDeseq_data)
summary(DumbDeseq_data)

# Volcano plot
library(ggplot2)
DumbDeseq_data$threshold <- as.factor(ifelse(DumbDeseq_data$pvalue < 0.01 & abs(DumbDeseq_data$log2FoldChange) > 1,
                                             ifelse(DumbDeseq_data$log2FoldChange > 1, "Upregulated", "Downregulated"), "Not Sig"))

ggplot(DumbDeseq_data, aes(x=log2FoldChange, y=-log10(pvalue), color=threshold)) +
  geom_point(alpha=0.8, size=1.5) +
  scale_color_manual(values=c("blue", "grey", "red")) +
  theme_minimal() +
  labs(title="Volcano Plot", x="Log2 Fold Change", y="-Log10(p-value)")

# histogram plot
hist(DumbDeseq_data$log2FoldChange, breaks=50, col="skyblue",
     main="Distribution of Log2 Fold Changes",
     xlab="Log2 Fold Change")

# Upregulated genes
up_genes <- subset(DumbDeseq_data, log2FoldChange > 1 & pvalue < 0.01)

# Downregulated genes
down_genes <- subset(DumbDeseq_data, log2FoldChange < -1 & pvalue < 0.01)

# Check top 5
top5_up <- head(up_genes[order(-up_genes$log2FoldChange), ], 5)
top5_down <- head(down_genes[order(down_genes$log2FoldChange), ], 5)

top5_up
top5_down

# bar plot for top genes
top_genes <- rbind(top5_up, top5_down)
library(ggplot2)
ggplot(top_genes, aes(x=reorder(rownames(top_genes), log2FoldChange),
                      y=log2FoldChange, fill=log2FoldChange > 0)) +
  geom_bar(stat="identity") +
  coord_flip() +
  labs(title="Top 5 Upregulated and Downregulated Genes",
       x="Genes", y="Log2 Fold Change") +
  scale_fill_manual(values=c("red","blue"))






















