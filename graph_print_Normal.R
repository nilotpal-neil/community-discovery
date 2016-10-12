graph.print.Nor<- function(vset,g1,g2)
{
  normalActiveNodes<- read.table("~/Project_Data_Files/Bone_Cell/Normal/Normal_Active_Nodes.txt")
  normalActiveNodes<- as.vector(normalActiveNodes[,1])
  vCharSetNormal <- "a"
  for(i in 1:length(vset))
  {
    vCharSetNormal[i]<- normalActiveNodes[vset[i]]
  }
  write(vCharSetNormal,file="~/Project_Data_Files/abc.txt", append = TRUE)
}