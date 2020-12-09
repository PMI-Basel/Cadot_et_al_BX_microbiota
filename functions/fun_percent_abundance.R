topTags_percent_abundance <- function(edgeR_table, topTags_table) {
  edgeR_table[,"CPM"] <- 2^(edgeR_table[,"logCPM"])
  edgeR_table[,"percentAllSeq"] <- round(
    edgeR_table[,"CPM"]*100/sum(edgeR_table[,"CPM"]),2)
  topTags_table[,"percentAllSeq"] <- edgeR_table[rownames(topTags_table),"percentAllSeq"]
  topTags_table
}


