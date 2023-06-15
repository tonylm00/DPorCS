# Caricamento dei dati dai file CSV
d1 <- read.table("data/mod/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/mod/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/mod/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/mod/D.csv", header = TRUE, sep = ";", dec = ".")

# Unione dei dati dei quattro gruppi in un unico dataframe
data <- rbind(
  data.frame(Gruppo = "A", man = d1$A),
  data.frame(Gruppo = "B", man = d2$B),
  data.frame(Gruppo = "C", man = d3$C),
  data.frame(Gruppo = "D", man = d4$D)
)

# Confronti a coppie con il test di Mann-Whitney (approssimazione normale)
pairwise.wilcox.test(data$man, data$Gruppo, p.adjust.method = "bonferroni", exact = FALSE)