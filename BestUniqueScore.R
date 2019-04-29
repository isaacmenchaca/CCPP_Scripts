library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
setwd("~/Desktop/Imenc001/Trinity.Fasta_files/BLAST_FILES/Trinity_3291_15")
#lab.data <- read.csv("Data1.csv") 

#lab.data <- read.csv("Sample sheet.csv")
lab.data <- read.csv("90_Trinity_3291_15.csv") 
names(lab.data) 
simplifyTable <- select(lab.data, Query.ID, evalue, bitscore) 


y <- length(lab.data$Query.ID) 

swapRows <- function(a, b){
  hold <- lab.data$Query.ID[a]
lab.data$Query.ID[a] <- lab.data$Query.ID[b]
lab.data$Query.ID[b] <- hold

  hold <- lab.data$Subject.ID[a]
lab.data$Subject.ID[a] <- lab.data$Subject.ID[b]
lab.data$Subject.ID[b] <- hold

  hold <- lab.data$Subject.IDs[a]
lab.data$Subject.IDs[a] <- lab.data$Subject.IDs[b]
lab.data$Subject.IDs[b] <- hold

  hold <- lab.data$Subject.Title[a]
lab.data$Subject.Title[a] <- lab.data$Subject.Title[b]
lab.data$Subject.Title[b] <- hold

  hold <- lab.data$percent.identity[a]
lab.data$percent.identity[a] <- lab.data$percent.identity[b]
lab.data$percent.identity[b] <- hold

  hold <- lab.data$Identical[a]
lab.data$Identical[a] <- lab.data$Identical[b]
lab.data$Identical[b] <- hold

  hold <- lab.data$Alignment.Length[a]
lab.data$Alignment.Length[a] <- lab.data$Alignment.Length[b]
lab.data$Alignment.Length[b] <- hold

  hold <- lab.data$Mismatches[a]
lab.data$Mismatches[a] <- lab.data$Mismatches[b]
lab.data$Mismatches[b]<- hold

  hold <- lab.data$query.start[a]
lab.data$query.start[a] <- lab.data$query.start[b]
lab.data$query.start[b] <- hold

  hold <- lab.data$query.end[a]
lab.data$query.end[a] <- lab.data$query.end[b]
lab.data$query.end[b] <- hold

  hold <- lab.data$subject.start[a]
lab.data$subject.start[a] <- lab.data$subject.start[b]
lab.data$subject.start[b] <- hold

  hold <- lab.data$subject.end[a]
lab.data$subject.end[a] <- lab.data$subject.end[b]
lab.data$subject.end[b] <- hold

  hold <- lab.data$evalue[a]
lab.data$evalue[a] <- lab.data$evalue[b]
lab.data$evalue[b] <- hold

  hold <- lab.data$bitscore[a]
lab.data$bitscore[a] <- lab.data$bitscore[b]
lab.data$bitscore[b] <- hold

lab.data
}

new_lab.data <- data.frame()

for( i in 1:y) { 
  IdenticalValueFound <- FALSE 
  k <- y - i
  a <- (y - k + 1) 
  if(k != 0){ 
    
  
    for(j in a:y){  
      if(as.character(lab.data$Query.ID[i]) == as.character(lab.data$Query.ID[j])){ 
        
        IdenticalValueFound <- TRUE 
        if((lab.data$bitscore[i] - lab.data$evalue[i]) > (lab.data$bitscore[j] - lab.data$evalue[j])){ 
          lab.data <- swapRows(i, j)
          break
        }
        
}
    }
  }
  
  if((!IdenticalValueFound) & (i == 1)){
    
    new_lab.data <- rbind(new_lab.data, data.frame(lab.data[i, ]))
    # Code simplified, bottom no longer needed
    #new_lab.data <- data.frame("Query.ID" = lab.data$Query.ID[i], 
    #                     "Subject.ID" = lab.data$Subject.ID[i], 
    #                    "Subject.IDs" = lab.data$Subject.IDs[i], 
    #                  "Subject.Title" = lab.data$Subject.Title[i], 
    #                 "percent.identity" = lab.data$percent.identity[i], 
    #               "Identical" = lab.data$Identical[i], 
    #             "Alignment.Length" = lab.data$Alignment.Length[i], 
    #            "Mismatches" = lab.data$Mismatches[i], 
    #           "query.start" = lab.data$query.start[i], 
    #          "query.end" = lab.data$query.end[i], 
    #         "subject.start" = lab.data$subject.start[i], 
    #        "subject.end" = lab.data$subject.end[i],
    #       "evalue" = lab.data$evalue[i], 
    #      "bitscore" = lab.data$bitscore[i])
  }
  
  else if(!IdenticalValueFound){
    new_lab.data <- rbind(new_lab.data, data.frame(lab.data[i, ]))
    # Code simplified, bottom no longer needed
    #new_lab.data <- data.frame("Query.ID" = lab.data$Query.ID[i], 
    #                     "Subject.ID" = lab.data$Subject.ID[i], 
    #                    "Subject.IDs" = lab.data$Subject.IDs[i], 
    #                  "Subject.Title" = lab.data$Subject.Title[i], 
    #                 "percent.identity" = lab.data$percent.identity[i], 
    #               "Identical" = lab.data$Identical[i], 
    #             "Alignment.Length" = lab.data$Alignment.Length[i], 
    #            "Mismatches" = lab.data$Mismatches[i], 
    #           "query.start" = lab.data$query.start[i], 
    #          "query.end" = lab.data$query.end[i], 
    #         "subject.start" = lab.data$subject.start[i], 
    #        "subject.end" = lab.data$subject.end[i],
    #       "evalue" = lab.data$evalue[i], 
    #      "bitscore" = lab.data$bitscore[i])
    
  }
  
}

unique(lab.data$Query.ID)
simplifyTable2 <- select(new_lab.data, Query.ID, evalue, bitscore) 
write.csv(simplifyTable2, file = "UNIQUE_SIMPLIFIED_90_Trinity_3291_15.csv")
write.csv(new_lab.data, file = "UNIQUE_90_Trinity_3291_15.csv")

