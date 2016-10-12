graph.print.Can<- function(vset,g1,g2)
{
  cancerActiveNodes<-read.table("~/Project_Data_Files/Bone_Cell/Cancer/Cancer_Active_Nodes.txt")
  cancerActiveNodes<- as.vector(cancerActiveNodes[,1])
  vCharSetCancer <- "a"
  for(i in 1:length(vset))
  {
    vCharSetCancer[i]<- cancerActiveNodes[vset[i]]
  }
  write(vCharSetCancer,file="~/Project_Data_Files/abc.txt", append = TRUE)
}