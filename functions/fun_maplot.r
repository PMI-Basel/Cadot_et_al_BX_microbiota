
### MA plotting function

## input information

# topTags_table - a topTags table from an edgeR analysis (built with "n=Inf, p.value=1")
# col_plus - color for WT enriched OTUs
# col_minus - color for mutant enriched OTUs
# title - plot title
# ylab, xlab
# ylim, xlim - dimensions of the plot

fun_maplot <- function(topTags_table, title, ylim, xlim, ylab, xlab)
{

  # data.frame with all, with enrich/deplet info
  topTags_table <- as.data.frame(topTags_table)
  forMA_plot <- data.frame(topTags_table$percent,
                          topTags_table$logFC,
                          topTags_table$FDR<0.05)
  colnames(forMA_plot) <- c("log2percent", "logFC", "signif")
  
  ## define colors
  forMA_plot$col[forMA_plot$signif==F] <- "dimgrey"
  forMA_plot$col[forMA_plot$logFC>0 & forMA_plot$signif==T] <- "gold2"
  forMA_plot$col[forMA_plot$logFC<0 & forMA_plot$signif==T] <- "palegreen3"
  # order for plotting colors
  forMA_plot$ord[forMA_plot$col=="dimgrey"] <- 1
  forMA_plot$ord[forMA_plot$col=="gold2"] <- 2
  forMA_plot$ord[forMA_plot$col=="palegreen3"] <- 3
  forMA_plot <- forMA_plot[sort(forMA_plot$ord,ind=T,decr=F)$ix,]
  
  ## define pch
  forMA_plot$pch[forMA_plot$signif==F] <- 1
  forMA_plot$pch[forMA_plot$signif==T] <- 16
  
  ## plot
  plot(forMA_plot$log2percent, 1*forMA_plot$logFC, log="x", ylim=ylim, xlim=xlim,
       main=title,
       ylab=ylab, xlab=xlab,
       col=forMA_plot$col, cex=2, bg=forMA_plot$col, pch=forMA_plot$pch, las=1)
  
}


