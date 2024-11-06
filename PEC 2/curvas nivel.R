#https://open.canada.ca/data/en/dataset/c46e9deb-882b-4e20-862d-4639fc6a9cf6
#https://www.donneesquebec.ca/recherche/dataset/courbes-de-niveaux-ouest

#install.packages("foreign")  
#install.packages("akima")  
library(foreign)
library(akima)

datos <- read.dbf("COURBE_NIVEAU_OUEST.dbf")



x <- datos$TYPE  
y <- datos$COTE
z <- datos$LONGUEUR

interpolacion <- interp(x, y, z, duplicate = "mean")


png("grafico_contorno.png", width = 1000, height = 1000)

contour(interpolacion$x, interpolacion$y, interpolacion$z,
        main = "Gráfico de Contorno",
        xlab = "COTE (X)", ylab = "LONGUEUR (Y)",
        col = topo.colors(10))

dev.off()


plot(datos$COTE, datos$LONGUEUR, 
     xlab = "COTE", 
     ylab = "LONGUEUR", 
     main = "Gráfico 2D de COTE vs LONGUEUR",
     pch = 16)


