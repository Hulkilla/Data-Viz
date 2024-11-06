# https://github.com/TimelineConsortium/Timeline-Data/blob/master/italy-presidents.json

install.packages("timevis")
library(timevis)

install.packages("jsonlite")
library(jsonlite)

italy_presidents <- fromJSON("italy-presidents.json")

# Cambiar el nombre de varias columnas a la vez
colnames(italy_presidents)[c(4, 5)] <- c("start", "end")

italy_presidents$content <-paste(
  "<b>", italy_presidents$content_text, "</b><br>",  # Título en negrita
  "<i>", italy_presidents$facet, "</i><br>",  # Descripción en cursiva
  "<small>", italy_presidents$category, "</small>"  # Detalles en un texto más pequeño
)

timevis(italy_presidents)
