# Carica i dati per tutti i gruppi
d1 <- read.table("data/mod/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/mod/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/mod/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/mod/D.csv", header = TRUE, sep = ";", dec = ".")

# Crea una lista con i dati di tutti i gruppi
dati <- list(d1$A, d2$B, d3$C, d4$D)

# Imposta la dimensione massima per il PNG (in pollici)
larghezza <- 10
altezza <- 12

# Imposta la risoluzione massima per il PNG (in punti per pollice)
dpi <- 1200

# Colori per i boxplot e la legenda (meno accesi)
col_boxplot <- c(rgb(1, 0, 0, alpha = 0.3), rgb(0, 0, 1, alpha = 0.3), rgb(0, 1, 0, alpha = 0.3), rgb(0.5, 0, 0.5, alpha = 0.3))
col_legenda <- col_boxplot

# Genera il boxplot unendo tutti i gruppi
png("out/boxplot_mod.png", width = larghezza, height = altezza, units = "in", res = dpi)
boxplot(dati, names = c("A", "B", "C", "D"), 
        main = "Modificabilità", ylab = "Risposte corrette", col = col_boxplot)

axis(2, at = seq(0, max(unlist(dati)), by = 0.5), 
     labels = ifelse(floor(seq(0, max(unlist(dati)), by = 0.5)) == seq(0, max(unlist(dati)), by = 0.5), 
                     as.character(seq(0, max(unlist(dati)), by = 0.5)), 
                     format(seq(0, max(unlist(dati)), by = 0.5), nsmall = 1)))

# Aggiungi la legenda
legend("topright", legend = c("A", "B", "C", "D"), fill = col_legenda)

dev.off()
