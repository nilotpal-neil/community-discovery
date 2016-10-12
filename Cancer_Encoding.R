library(igraph)
Cancer.Active.Node<- scan(file = "~/Project_Data_Files/Bone_Cell/Cancer/Cancer_Active_Nodes.txt", what = character())
Active.Nodes.Num<-as.matrix(1:length(Cancer.Active.Node))
row.names(Active.Nodes.Num)<-Cancer.Active.Node
Cancer.Edges <- read.csv("~/Project_Data_Files/Bone_Cell/Cancer/Cancer_Edges.csv", header=FALSE)
keep<-c("V2","V3")
Cancer.Edges<-Cancer.Edges[keep]
Cancer.Edges<-data.frame(Cancer.Edges[-1,])
Cancer.Edges.Numerical<-data.frame(nrow=nrow(Cancer.Edges),ncol=2)
for(i in 1:nrow(Cancer.Edges))
{
  for(j in 1:length(Cancer.Edges))
  {
    str<-as.character(Cancer.Edges[i,j])
    Cancer.Edges.Numerical[i,j]<- Active.Nodes.Num[str,]
    Cancer.Edges.Numerical[i,j]<- Cancer.Edges.Numerical[i,j]-1
  }
}
write.csv(Cancer.Edges.Numerical,file="~/Project_Data_Files/Bone_Cell/Cancer/Cancer_Edges_Numerical.csv")
#removing parellel edges
g<- graph.data.frame(Cancer.Edges.Numerical, directed=F)
g<- simplify(g)
Cancer.Edges.Numerical<- get.data.frame(g)
write.csv(Cancer.Edges.Numerical,file="~/Project_Data_Files/Bone_Cell/Cancer/Final_Cancer_Numerical_Edges.csv")