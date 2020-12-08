
# library(ggplot2)

## STATS: use following code c("", "", "", "*", "", "*")
# "" ""   "" "*"  "" "*"
# WT bx1  WT bx1  WT bx1
# #270    #479    #647

fun_plotting_figS10 <- function(DAT, SAMPLEGROUP, YLIM, STATS){
  ggplot(DAT, aes_string(x="genotype", y="Mean", fill="genotype")) + 
  geom_errorbar(aes(ymin=Mean-SE, ymax=Mean+SE), width=.2, position=position_dodge(.9)) +
  geom_bar(stat="identity") + 
  facet_grid(cols=vars(OTU)) +
  xlab("") + 
  ylab("Relative abundance (%)")  +
  ylim(0,YLIM) +
  ggtitle(SAMPLEGROUP) +
  scale_fill_manual(values=c("gold2","seagreen")) +
  scale_colour_manual(values=colors) +
  theme(panel.background=element_blank(),
        strip.text.x=element_text(size=12),
        legend.title=element_blank(),
        legend.position="none",
        axis.text.x=element_text(angle=0, hjust=0.5, vjust=0.5, size=12),
        axis.text.y=element_text(angle=0, hjust=1, vjust=0.5, size=12),
        axis.title.y=element_text(size=12),
        axis.line=element_line(colour="black") ) +
    geom_text(aes(label=STATS), position=position_dodge(width=0.9), vjust=-1.5, hjust=0.5)
}

