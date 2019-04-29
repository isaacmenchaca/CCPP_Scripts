library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
setwd("~/Desktop/Imenc001/Trinity.Fasta_files/BLAST_FILES/Trinity_3291_15")
#lab.data <- read.csv("Data1.csv") 

#lab.data <- read.csv("Sample sheet.csv")
lab.data.alignment <- read.csv("Trinity_3291_15_filtered.csv") 
names(lab.data.alignment)
simplifyTable.alignment <- select(lab.data.alignment, Query.ID, Alignment.Length)

y <- length(lab.data.alignment$Query.ID) 

new_lab.data50.alignment <- data.frame()
new_lab.data70.alignment <- data.frame()
new_lab.data90.alignment <- data.frame()

for(i in 1:y){
  
  if(as.integer(lab.data.alignment$Alignment.Length[i]) >= 50){
   
   # shortened code.
   
      new_lab.data50.alignment <- rbind(new_lab.data50.alignment, data.frame(lab.data.alignment[, i]))
      # previous: Unecessarily long.
      
      #"Query.ID" = lab.data.alignment$Query.ID[i],
      #"Subject.ID" = lab.data.alignment$Subject.ID[i],
      #"Subject.IDs" = lab.data.alignment$Subject.IDs[i],
      #"Subject.Title" = lab.data.alignment$Subject.Title[i],
      #"percent.identity" = lab.data.alignment$percent.identity[i],
      #"Identical" = lab.data.alignment$Identical[i],
      #"Alignment.Length" = lab.data.alignment$Alignment.Length[i],
      #"Mismatches" = lab.data.alignment$Mismatches[i],
      #"query.start" = lab.data.alignment$query.start[i],
      #"query.end" = lab.data.alignment$query.end[i],
      #"subject.start" = lab.data.alignment$subject.start[i],
      #"subject.end" = lab.data.alignment$subject.end[i],
      #"evalue" = lab.data.alignment$evalue[i],
      #"bitscore" = lab.data.alignment$bitscore[i]))
      }
  
  if (as.integer(lab.data.alignment$Alignment.Length[i]) >= 70){
    new_lab.data70.alignment <- rbind(new_lab.data70.alignment, data.frame(lab.data.alignment[, i]))
    }
  
  if (as.integer(lab.data.alignment$Alignment.Length[i]) >= 90){
    new_lab.data90.alignment <- rbind(new_lab.data90.alignment, data.frame(lab.data.alignment[, i]))
  }
}

write.csv(new_lab.data50.alignment, file = "50_Trinity_3291_15.csv")
write.csv(new_lab.data70.alignment, file = "70_Trinity_3291_15.csv")
write.csv(new_lab.data90.alignment, file = "90_Trinity_3291_15.csv")
      
