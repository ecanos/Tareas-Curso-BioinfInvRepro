#Ejercicio 1 Tarea 6.2

#Cargar el archivo
read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#nombrar el objeto como "fullmat"
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt", header = T)

#Para conocer el tipo de objeto que creamos
class(fullmat)

#Para ver las primeras 6 l�neas del archivo
head(fullmat)

#Para saber el n�mero de muestras
nrow(fullmat)

#Para saber de cu�ntos Estados se tienen muestras
length(unique(fullmat$Estado))

#Cuenta todos los datos anteriores a 1980
sum(fullmat$`A�.o._de_colecta`<1980,na.rm =TRUE)

#Para conocer la frecuencia de cada raza
table(fullmat$Raza)

#Conocer la altitud promedio a la que fueron colectadas las muestras
mean(fullmat$Altitud)

#Altitud m�xima y m�nima a la que fueron colectadas
range(fullmat$Altitud)

#Crea una nueva df con los datos de Olotillo
olotillo <- subset(fullmat, Raza == "Olotillo")

#Cea una nueva df con los datos de reventador, jala, ancho
tresmuestras<- subset(fullmat, Raza == "Reventador"|Raza == "Jala"|Raza == "Ancho")

#Crear un archivo llamado submat.csv con la matriz anterior
write.csv(tresmuestras, "../meta/Submat.csv")
