build.nodes <- function(tran) {
  nodes <- c()
  edges <- c()
  
  for(i in 1:length(tran)){
    #Get rid of arrow
    tran[i] <- gsub("->", "", tran[i])
    #Get rid of spaces
    tran[i] <- gsub(" ","", tran[i])
    
    edges <- c(edges, substring(tran[i],2,2))
    if(nchar(tran[i]) == 3){
      nodes <- c(nodes, substring(tran[i],1,1), substring(tran[i],3,3))
    }
    else{
      nodes <- c(nodes, substring(tran[i],1,1), "Z")
    }
  }
  unique.nodes <- unique(nodes)
  tam <- length(unique.nodes)
  type.node <- rep(1, tam)
  type.node["S"==unique.nodes]<- 2
  type.node["Z"==unique.nodes]<- 3
  
  list.column <- list(nodes = nodes, edges = edges, type.node = type.node)
  return(list.column)
}

