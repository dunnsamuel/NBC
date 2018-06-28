library(splitstackshape)

getNumTaxaNames <- function(file, kingdom){
  taxonomy <- read.table(file=file, row.names=1)
  sub.tax <- as.character(taxonomy[grepl(kingdom, taxonomy[,1]),])
  
  phyla <- as.vector(levels(as.factor(gsub("[^;]*;([^;]*;).*", "\\1", sub.tax))))
  phyla <- sum(!grepl(kingdom, phyla))
  
  class <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
  class <- sum(!grepl(kingdom, class))
  
  order <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
  order <- sum(!grepl(kingdom, order))
  
  family <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
  family <- sum(!grepl(kingdom, family))
  
  genus <- as.vector(levels(as.factor(gsub("[^;]*;[^;]*;[^;]*;[^;]*;[^;]*;([^;]*;).*", "\\1", sub.tax))))
  genus <- sum(!grepl(kingdom, genus))
  
  n.seqs <- length(sub.tax)
  return(c(phyla=phyla, class=class, order=order, family=family, genus=genus, n.seqs=n.seqs))
}

getNumTaxaNamesFM <- function(file, kingdom){
  taxonomy <- read.table(file=file, row.names=1)
  sub.tax <- as.character(taxonomy[grepl(kingdom, taxonomy[,1]),])
  sub.tax.spl<-cSplit(as.data.frame(sub.tax),1,sep=";")
  if(kingdom!="Eukaryota")
  {
    setnames(sub.tax.spl,old=colnames(sub.tax.spl),
             new=c("Regnum","Phylum","Classis","Ordo","Familia","Genus"))
  }else{
    setnames(sub.tax.spl,old=colnames(sub.tax.spl),
             new=c("Regnum","Supergroup","Phylum","Classis","Ordo",
                   "Familia","Genus"))
  }
  phyla <- nlevels(sub.tax.spl$Phylum)
  classis <- nlevels(sub.tax.spl$Classis) 
  #avoid using class, an internal R function, as an object name
  ordo <- nlevels(sub.tax.spl$Ordo)
  #avoid using order, an internal R function, as an object name
  familia <- nlevels(sub.tax.spl$Familia)
  #avoid using family, an internal R function, as an object name
  genus <- nlevels(sub.tax.spl$Genus)
  n.seqs <- length(sub.tax)
  return(c(phyla=phyla, classis=classis, ordo=ordo, familia=familia,
           genus=genus, n.seqs=n.seqs))
}


kingdoms <- c("Bacteria", "Archaea", "Eukaryota")
tax.levels <- c("phyla", "class", "order", "family", "genus", "n.seqs")
tax.levels.FM <- c("phyla", "classis", "ordo", "familia", "genus", "n.seqs")

nr.file <- "silva.nr_v132.tax"
nr.matrix <- matrix(rep(0,18), nrow=3)
nr.matrix[1,] <- getNumTaxaNames(nr.file, kingdoms[1])
nr.matrix[2,] <- getNumTaxaNames(nr.file, kingdoms[2])
nr.matrix[3,] <- getNumTaxaNames(nr.file, kingdoms[3])
rownames(nr.matrix) <- kingdoms
colnames(nr.matrix) <- tax.levels
nr.matrix

seed.file <- "silva.sd_v132.tax"
seed.matrix <- matrix(rep(0,18), nrow=3)
seed.matrix[1,] <- getNumTaxaNames(seed.file, kingdoms[1])
seed.matrix[2,] <- getNumTaxaNames(seed.file, kingdoms[2])
seed.matrix[3,] <- getNumTaxaNames(seed.file, kingdoms[3])
rownames(seed.matrix) <- kingdoms
colnames(seed.matrix) <- tax.levels
seed.matrix

full.file <- "silva.full_v128.tax"
full.matrix <- matrix(rep(0,18), nrow=3)
full.matrix[1,] <- getNumTaxaNames(full.file, kingdoms[1])
full.matrix[2,] <- getNumTaxaNames(full.file, kingdoms[2])
full.matrix[3,] <- getNumTaxaNames(full.file, kingdoms[3])
rownames(full.matrix) <- kingdoms
colnames(full.matrix) <- tax.levels
full.matrix

seed.matrix / nr.matrix
seed.matrix / full.matrix
nr.matrix / full.matrix

