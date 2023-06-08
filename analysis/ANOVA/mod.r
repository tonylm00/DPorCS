#ANOVA
d1 <- read.table("data/mod/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/mod/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/mod/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/mod/D.csv", header = TRUE, sep = ";", dec = ".")

dati <- data.frame(
  Valore = c(d1$A, d2$B, d3$C, d4$D),
  Gruppo = rep(c("DP-CS", "DP", "CS", "NO"), times = c(length(d1$A), length(d2$B), length(d3$C), length(d4$D)))
)

modello_anova <- aov(Valore ~ Gruppo, data = dati)

summary(modello_anova)

#L'analisi ha rilevato una differenza significativa tra i gruppi (F = 3.682, p = 0.034). 
#Ciò indica che esistono delle differenze statisticamente significative tra almeno due dei quattro gruppi considerati.

#Residuals
#Questa riga fornisce informazioni sul residuo dell'analisi, ovvero l'errore residuo non spiegato dalla variabile indipendente. 
#L'errore residuo totale è di 22.33.

#Sulla base dei risultati, 
#possiamo concludere che esiste una differenza significativa tra i gruppi in relazione alla nuova variabile dipendente. 
#Tuttavia, è importante considerare che l'interpretazione può variare in base ai tuoi dati specifici e al livello di significatività scelto. 
#Assicurati di considerare anche il contesto dello studio per trarre conclusioni adeguate.


# Esegui il test di Tukey come analisi post-hoc
tukey_result <- TukeyHSD(modello_anova)

# Visualizza i risultati del test di Tukey
print(tukey_result)

#I risultati del test di Tukey mostrano i confronti tra i gruppi e forniscono informazioni sulle differenze significative tra di essi. 
#Di seguito l'interpretazione dei risultati:

#DP-CS: Non c'è una differenza significativa tra il gruppo DP e il gruppo CS (p > 0.05).
#DP-CS-CS: Non c'è una differenza significativa tra il gruppo DP-CS e il gruppo CS (p > 0.05).
#NO-CS: Non c'è una differenza significativa tra il gruppo NO e il gruppo CS (p > 0.05).
#DP-CS-DP: Non c'è una differenza significativa tra il gruppo DP-CS e il gruppo DP (p > 0.05).
#NO-DP: Non c'è una differenza significativa tra il gruppo NO e il gruppo DP (p > 0.05).
#NO-DP-CS: C'è una differenza significativa tra il gruppo NO-DP e il gruppo CS (p < 0.05).
#I valori "diff" rappresentano la differenza stimata tra i gruppi, mentre "lwr" e "upr" indicano gli intervalli di confidenza per la differenza. 
#Il valore "p adj" rappresenta il valore di p corretto per il controllo della famiglia di errori, utilizzando l'approccio di correzione di Tukey.
#In base a questi risultati, possiamo concludere che non ci sono differenze significative tra la maggior parte dei confronti tra gruppi, 
#tranne per il confronto tra il gruppo NO-DP e il gruppo CS, dove si osserva una differenza significativa.

