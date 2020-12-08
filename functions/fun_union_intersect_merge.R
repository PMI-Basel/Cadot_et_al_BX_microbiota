
union_three <- function(a,b,c) 
{union(union(a,b),c)}
union_four<- function(a,b,c,d) 
{union(union(union(a,b),c),d)}
union_five<- function(a,b,c,d,e) 
{union(union(union(union(a,b),c),d),e)}


intersect_three <- function(a,b,c) 
{intersect(intersect(a,b),c)}
intersect_four <- function(a,b,c,d) 
{intersect(intersect(intersect(a,b),c),d)}
intersect_five <- function(a,b,c,d,e) 
{intersect(intersect(intersect(intersect(a,b),c),d),e)}


merge_four <- function(df_1, df_2, df_3, df_4, by = intersect(names(df_1), names(df_2))) 
  {merge(merge(merge(df_1, df_2, all=T, by=by), df_3, all=T, by=by), df_4, all=T, by=by)}


merge_six_row <- function(df_1, df_2, df_3, df_4, df_5, df_6, by = "row.names") {
  df_1 <- as.data.frame(df_1)
  df_2 <- as.data.frame(df_2)
  df_3 <- as.data.frame(df_3)
  df_4 <- as.data.frame(df_4)
  df_5 <- as.data.frame(df_5)
  df_6 <- as.data.frame(df_6)
  transform( merge (transform(merge (transform(merge (transform(merge (transform(merge(
    df_1, df_2, all=T, by=0),  row.names=Row.names, Row.names=NULL),
    df_3, all=T, by=0), row.names=Row.names, Row.names=NULL),
    df_4, all=T, by=0), row.names=Row.names, Row.names=NULL),
    df_5, all=T, by=0), row.names=Row.names, Row.names=NULL),
    df_6, all=T, by=0), row.names=Row.names, Row.names=NULL)
}

