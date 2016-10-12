is.graph<- function(a)
{
  if(vcount(a)>0)
    return(TRUE)
  else return(FALSE)
}
is.community<- function(a)
{
  if(modularity(a)>0)
    return(TRUE)
  else return(FALSE)
}
iterative.clustering<- function(comObj,newGraphObj,vertexSetMat,counter=1)
{  
  if(is.graph(newGraphObj)==FALSE)
  {stop("error:iterative.clustering(a,b) -> b should be graph object")}
  if(is.community(comObj)==FALSE)
  {
    return(counter)
  }
  else if(is.community(comObj)>0.1) 
  {
    index<-which.max(sizes(comObj))
    vertexSetMat[counter+1]<- -1
    tempFrame<- as.data.frame(comObj[index])
    tempVector1<-as.vector(tempFrame[,1])
    tempVector<- tempVector1-1
    for(i in 0:(max(sizes(comObj))-1))
    {
        ind<- match(tempVector[i+1],vertexSetMat[,counter])
        vertexSetMat[ind,(1+counter)] <- i
    } 
    newGraphObj<- induced.subgraph(newGraphObj,tempVector1)
    v_count<-vcount(newGraphObj)
    comObj<- multilevel.community(newGraphObj)
    #comObj<- fastgreedy.community(newGraphObj)
    write(v_count, file="vertexCount.txt", append = T)
    write.csv(vertexSetMat,"~/Project_Data_Files/dFrame.csv")
    write.graph(newGraphObj,file="abc.txt")
    file.append("def.txt","abc.txt")
    unlink("abc.txt")
    counter<-counter+1
    iterative.clustering(comObj,newGraphObj,vertexSetMat,counter)
  }
}
graph.setup<-function()
{
  dFrame<-as.data.frame(read.csv("~/Project_Data_Files/dFrame.csv"))
  dFrame<- dFrame[-1]
  v<-read.table("vertexCount.txt")
  v<-as.vector(v[,1])
  #edgeList<-read.table("def.txt")
  for(i in 2:(length(v)+1))
  {
    for(j in 1:nrow(dFrame))
    {
      if((dFrame[j,i]>=0) & (dFrame[j,i]<= v[i-1]))
      {
        dFrame[j,i]<- j
      }
    }
  }
  write.csv(dFrame,"~/Project_Data_Files/final.csv")
  unlink("vertexCount.txt")
}