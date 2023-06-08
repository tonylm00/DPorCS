#Analisi descrittiva gruppo A
data <- read.table("data/com/A.csv", header = TRUE, sep = ";", dec = ".")
summary(data$A)
sd(data$A)

#Analisi descrittiva gruppo B
data <- read.table("data/com/B.csv", header = TRUE, sep = ";", dec = ".")
summary(data$B)
sd(data$B)

#Analisi descrittiva gruppo C
data <- read.table("data/com/C.csv", header = TRUE, sep = ";", dec = ".")
summary(data$C)
sd(data$C)

#Analisi descrittiva gruppo D
data <- read.table("data/com/D.csv", header = TRUE, sep = ";", dec = ".")
summary(data$D)
sd(data$D)

