##Descargar data de la secuenciación de un genoma de E. coli

##Instalar 'rentrez'
##Desde la terminal instalar 'devtools'
# S sudo apt-get install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev
# $ sudo -i R
# > install.packages('devtools')
##Instalar 'rentrez'
# > devtools::install_github('ropensci/rentrez')


library(rentrez)


#Descargar el artículo relacionado con el tema que quiero estudiar
library(rentrez)
ecoli_paper<-entrez_search(db="pubmed", term = "10.3389/fmicb.2017.00789[doi]")
ecoli_paper$ids

#Buscar cualquier tipo de dato disponible de este artículo
ecoli_data <- entrez_link(db="all", id=ecoli_paper$ids, dbfrom = "pubmed" )
ecoli_data

#Datos disponibles con el Elemento 'links'
ecoli_data$links

#Obtener las secuencias de los cromosomas en formato fasta
ecoli_chr <- entrez_fetch(db="pubmed", id=ecoli_data$links$pubmed_pubmed, rettype = "fasta")


#Búsqueda de artículos por año 2010-2017 referentes a genomica
artyear <- function(years, search_term){
  return(sapply(years, function(y) entrez_search(db="pubmed",term=search_term, mindate=y, maxdate=y, retmax=0)$count))
}
years <- 2010:2017
artotal <- artyear(years, "2010:2017")
omics <- c("genomic")
trend_data <- sapply(omics, function(t) artyear(years, t))
trend_props <- trend_data/artotal

#Plotear los datos de articulos publicados
library(reshape)
library(ggplot2)
trend_df <- melt(data.frame(years, trend_props), id.vars="years")
p <- ggplot(trend_df, aes(years, value, colour=variable))
p + geom_line(size=1) + scale_y_log10("number of papers")
