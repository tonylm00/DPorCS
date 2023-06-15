#ANOVA
d1 <- read.table("data/mod/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/mod/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/mod/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/mod/D.csv", header = TRUE, sep = ";", dec = ".")

dati <- data.frame(
  Valore = c(d1$A, d2$B, d3$C, d4$D),
  Gruppo = rep(c("A", "B", "C", "D"), times = c(length(d1$A), length(d2$B), length(d3$C), length(d4$D)))
)

modello_anova <- aov(Valore ~ Gruppo, data = dati)

summary(modello_anova)


tukey_result <- TukeyHSD(modello_anova)

print(tukey_result)
