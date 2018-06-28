tax <- read.table(file="silva.full_v132.tax.temp", sep="\t")
tax$V2 <- gsub(" ", "_", tax$V2)  #convert any spaces to underscores
tax$V2 <- gsub("uncultured;", "", tax$V2)   #remove any "uncultured" taxa names

#tax$V2 <- paste0("Root;", tax$V2)   #pre-empt all classifications with the Root level.

#we want to see whether everything has 7 (6) taxonomic levesl (Root to genus)
getDepth <- function(taxonString){
  initial <- nchar(taxonString)
  removed <- nchar(gsub(";", "", taxonString))
  return(initial-removed)
}


depth <- getDepth(tax$V2)
bacteria <- grepl("Bacteria;", tax$V2)
archaea <- grepl("Archaea;", tax$V2)
eukarya <- grepl("Eukaryota;", tax$V2)

tax[depth > 6 & bacteria,] #good to go
tax[depth > 6 & archaea,]  #good to go
tax[depth > 6 & eukarya,]  #eh, there's a lot here - will truncate to the pseudo genus level
tax[depth > 6 & eukarya,2] <- gsub("([^;]*;[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;).*", "\\1", tax[depth > 6 & eukarya,2])

depth <- getDepth(tax$V2)
tax[depth > 6 & eukarya,]  #good to go

write.table(tax, file="silva.full_v132.tax", quote=F, row.names=F, col.names=F)
