df <-read.csv("~/Project_Data_Files/final_Normal.csv")
df<- df[-1]
source('~/Project_Data_Files/Bone_Cell/Normal/graph_print_Normal.R')
g_normal<- read.graph("~/Project_Data_Files/Bone_Cell/Normal/Igraph_Normal_Edges.txt",directed=F)
g_cancer<- read.graph("~/Project_Data_Files/Bone_Cell/Cancer/Igraph_Cancer_Edges.txt",directed=F)
for(i in 2:ncol(df))
{
  vset<-1
  k<-1
  vchar<- as.character()
  for(j in 1:nrow(df))
  {
    if(df[j,i]>0)
    {
      vset[k]<- df[j,i]
      k<- k+1
    }
  }
  graph.print.Nor(vset,g_normal,g_cancer)
}