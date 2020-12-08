
# library(ggplot2)

fun_plotting_fig6 <- function(dat, colors, fill_dat){
  ggplot(dat, aes_string(x="genotype", y="Abundance", fill=fill_dat)) + 
  geom_bar(stat="identity") + 
  facet_grid(cols=vars(location)) +
  xlab("") + 
  ylab("Relative abundance (%)")  +
  scale_colour_manual(values=colors) +
  scale_fill_manual(values=colors) +
  theme(panel.background=element_blank(),
        strip.text.x=element_text(size=12),
        legend.title=element_blank(),
        legend.position="none",
        axis.text.x=element_text(angle=0, hjust=0.5, vjust=0.5, size=12),
        axis.text.y=element_text(angle=0, hjust=1, vjust=0.5, size=12),
        axis.title.y=element_text(size=12),
        axis.line=element_line(colour = "black") )
}
