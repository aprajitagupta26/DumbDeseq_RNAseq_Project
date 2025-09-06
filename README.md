# DumbDeseq_RNAseq_Project
# Differential Gene Expression Analysis using DumbDeseq in R

This repository contains my HackBio project report and analysis scripts for exploring **RNA-seq based differential gene expression** using the DumbDeseq pipeline in R.  
The project compares diseased cell lines with those treated by a compound and identifies key upregulated and downregulated genes, followed by functional annotation using the **GeneCards** database.

---

## 📂 Repository Structure
- `report/` : Final project report (PDF)  
- `scripts/` : R scripts for data analysis and visualization (to be added)  
- `results/` : Figures and plots generated during analysis (to be added)  
- `data/` : Dataset info or sample files (if public dataset available)  

---

## 🎯 Objectives
- Analyze a pre-processed RNA-seq dataset provided by HackBio in **RStudio**.  
- Generate a **volcano plot** for visualizing fold change vs. significance.  
- Identify significantly **upregulated and downregulated genes**.  
- Annotate selected genes using the **GeneCards database** to explore their biological functions.  

---

## 🧪 Methodology
1. Used RStudio (2024.12.0) for RNA-seq data analysis.  
2. Applied log2 fold change thresholds (`> 1` for upregulated, `< -1` for downregulated) and **p < 0.01** for significance.  
3. Generated visualizations:  
   - Volcano plot  
   - Histogram of fold changes  
   - Bar plot of top differentially expressed genes  
4. Annotated top genes with functional insights from **GeneCards**.  

---

## 📊 Results
- Dataset contained **16,406 genes**.  
- Identified **19 significantly upregulated** and **91 significantly downregulated** genes.  
- **Top Upregulated Genes:** EMILIN2, VEPH1, POU3F4, LOC285954, DTHD1  
- **Top Downregulated Genes:** TBX5, IFITM1, LAMA2, CAV2, TNN  
- These genes are involved in pathways such as extracellular matrix stability, apoptosis, immune defense, and developmental regulation.  

---

## 🚀 How to Run the Code
1. Clone the repository:
   ```bash
   git clone https://github.com/username/DumbDeseq_RNAseq_Project.git

