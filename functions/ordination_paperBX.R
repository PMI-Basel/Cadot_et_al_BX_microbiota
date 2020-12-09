
text_graph <- function (text_paste, srt=0, size=1) {
  text = paste(text_paste)
  text <- ggplot(plot.margin = unit(c(0.08, 0.08, 0.08, 0.08), "pt")) + 
    annotate("text", x = 4, y = 25, size=size, srt=srt, label = text) + 
    theme_void()
}



ordination_paperBX <- function(PHYSEQ_object, model, method, shape=NULL, color=NULL, shape_values=NULL, color_values=NULL, title=NULL, title_var=F) {
  
  # library(phyloseq)
  PHYSEQ_object_CAP_bray <- ordinate(PHYSEQ_object, method=method, model, distance="bray")
  # extract variation details
  CAP_bray_var_tbl <- variability_table(PHYSEQ_object_CAP_bray)
  # ANOVA
  # source("functions/variability_table.R")
  CAP_bray_anova <- anova.cca(PHYSEQ_object_CAP_bray, permutations=99999)
  #pander(CAP_bray_anova[1:4])
  
  if(title_var == T) {
    title <- paste("[",format(CAP_bray_var_tbl["constrained", "proportion"] * 100, digits=2, nsmall=1), 
                   "% of variance, P = ", 
                   format(CAP_bray_anova[1, 4], digits=2), 
                   "]", sep = "")
  } else {title <- title}
  
  p0 <- phyloseq::plot_ordination(PHYSEQ_object, PHYSEQ_object_CAP_bray, color=color, shape=shape, axes=1:2)
  p0$layers <- p0$layers[-1]
  p0 <- p0 + geom_point(size=3, stroke=1)
  p0 <- p0 + scale_color_manual(values=color_values)
  p0 <- p0 + scale_shape_manual(values=shape_values)
  p0 <- p0 + ggtitle(title)
  p0 <- p0 + theme(plot.title = element_text(size=9, face = "bold"))
}

