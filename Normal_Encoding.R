library(igraph)
Normal.Active.Node<- scan(file = "~/Project_Data_Files/Bone_Cell/Normal/Normal_Active_Nodes.txt", what = character())
Active.Nodes.Num<-as.matrix(1:length(Normal.Active.Node))
row.names(Active.Nodes.Num)<-Normal.Active.Node
Normal.Edges <- read.csv("~/Project_Data_Files/Bone_Cell/Normal/Normal_Edges.csv", header=FALSE)
keep<-c("V2","V3")
Normal.Edges<-Normal.Edges[keep]
Normal.Edges<-data.frame(Normal.Edges[-1,])
Normal.Edges.Numerical<-data.frame(nrow= nrow(Normal.Edges),ncol=2)
for(i in 1:nrow(Normal.Edges))
{
  for(j in 1:length(Normal.Edges))
  {
    str<-as.character(Normal.Edges[i,j])
    Normal.Edges.Numerical[i,j]<- Active.Nodes.Num[str,]
    Normal.Edges.Numerical[i,j]<- Normal.Edges.Numerical[i,j]-1
  }
}
write.csv(Normal.Edges.Numerical,file="~/Project_Data_Files/Bone_Cell/Normal/Normal_Edges_Numerical.csv")
#removing parellel edges
g<- graph.data.frame(Normal.Edges.Numerical, directed = F)
g<- simplify(g)
Normal.Edges.Numerical<- get.data.frame(g)
write.csv(Normal.Edges.Numerical,file="~/Project_Data_Files/Bone_Cell/Normal/Final_Normal_Numerical_Edges.csv")