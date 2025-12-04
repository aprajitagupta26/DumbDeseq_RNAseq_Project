library(readr)
DumbDeseq_data <- read_csv("DumbDeseq_data.csv")
View(DumbDeseq_data)
summary(DumbDeseq_data)

# Volcano plot
# Basic volcano plot
with(df, plot(
  log2FoldChange, -log10(pvalue),
  pch = 20,
  col = "black",
  xlab = "Log2 Fold Change",
  ylab = "-Log10 p-value",
  main = "Volcano Plot (Base R)"
))

# Identify upregulated genes
up <- df$log2FoldChange > 1 & df$pvalue < 0.01

# Identify downregulated genes
down <- df$log2FoldChange < -1 & df$pvalue < 0.01

# Add upregulated points (red)
points(
  df$log2FoldChange[up],
  -log10(df$pvalue[up]),
  pch = 20,
  col = "red"
)

# Add downregulated points (blue)
points(
  df$log2FoldChange[down],
  -log10(df$pvalue[down]),
  pch = 20,
  col = "blue"
)

# histogram plot
hist(
  df$log2FoldChange,
  breaks = 50,
  col = "lightgray",
  main = "Distribution of Log2 Fold Change",
  xlab = "Log2 Fold Change"
)

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
# Combine values
bar_values <- c(top5_up$log2FoldChange, top5_down$log2FoldChange)

# Combine names
bar_names <- c(top5_up$Gene, top5_down$Gene)

# Plot
barplot(
  bar_values,
  names.arg = bar_names,
  las = 2,
  col = c(rep("red", 5), rep("blue", 5)),
  main = "Top 5 Upregulated and Downregulated Genes",
  ylab = "Log2 Fold Change"
)

#   STEP 7: SAVE RESULTS TO FILES

write.csv(upregulated, "Upregulated_Genes.csv", row.names = FALSE)
write.csv(downregulated, "Downregulated_Genes.csv", row.names = FALSE)
write.csv(top5_up, "Top5_Upregulated.csv", row.names = FALSE)
write.csv(top5_down, "Top5_Downregulated.csv", row.names = FALSE)

############################################






















