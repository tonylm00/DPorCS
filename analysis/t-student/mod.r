# Caricamento dei dati
d1 <- read.table("data/mod/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/mod/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/mod/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/mod/D.csv", header = TRUE, sep = ";", dec = ".")

# Unione dei dati in un unico dataframe
data <- data.frame(
  Gruppo = rep(c("A", "B", "C", "D"), c(nrow(d1), nrow(d2), nrow(d3), nrow(d4))),
  mod = c(d1$A, d2$B, d3$C, d4$D)
)

# Confronto dei quattro gruppi utilizzando il test del t di Student
# Rispetto al Gruppo A
t_test_result <- pairwise.t.test(data$mod, data$Gruppo, p.adjust.method = "none")
t_test_result

# Numero totale di confronti
num_confronti <- 6

# Aggiustamento di Bonferroni
bonferroni_adjusted_p <- pairwise.t.test(data$mod, data$Gruppo, p.adjust.method = "bonferroni")

# Stampare i valori di p aggiustati di Bonferroni
print(bonferroni_adjusted_p$p.value)
