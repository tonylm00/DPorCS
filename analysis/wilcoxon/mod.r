# Caricamento dei dati dai file CSV
d1 <- read.table("data/mod/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/mod/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/mod/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/mod/D.csv", header = TRUE, sep = ";", dec = ".")

# Unione dei dati dei quattro gruppi in un unico dataframe
data <- rbind(
  data.frame(Gruppo = "A", Risposte_corrette = d1$A),
  data.frame(Gruppo = "B", Risposte_corrette = d2$B),
  data.frame(Gruppo = "C", Risposte_corrette = d3$C),
  data.frame(Gruppo = "D", Risposte_corrette = d4$D)
)

# Esecuzione del test di Kruskal-Wallis
result <- kruskal.test(Risposte_corrette ~ Gruppo, data = data)

# Stampa dei risultati
print(result)
