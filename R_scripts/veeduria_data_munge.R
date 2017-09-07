#CREATED: GTP 9-4-17
#UPDATED: 

#install.packages("shiny")
install.packages("data.table")

#library(shiny)
library(data.table)

#read in geocoded veedruia data
setwd("~/Desktop/bloomberg_work/bogota_project/data")
df_raw <- read.csv("df_veeduria2.csv")
fecha <- aggregate(df_raw$Numero.petición, by=list(df_raw$Sector, df_raw$Fecha.ingreso), FUN=length)

colnames(df_raw)
drops <- c("Tema_SDQS", "Fecha.registro", "Localidad..del.ciudadano", "UPZ.del.ciudadano",
           "Barrio.del.ciudadano", "Estrato.del.ciudadano", "Numero.petición")
df_small <- df_raw[ , !(names(df_raw) %in% drops)]

write.csv(df_small, file = "f_veeduria2_R.csv")
