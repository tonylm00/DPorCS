#ANOVA
d1 <- read.table("data/com/A.csv", header = TRUE, sep = ";", dec = ".")
d2 <- read.table("data/com/B.csv", header = TRUE, sep = ";", dec = ".")
d3 <- read.table("data/com/C.csv", header = TRUE, sep = ";", dec = ".")
d4 <- read.table("data/com/D.csv", header = TRUE, sep = ";", dec = ".")

dati <- data.frame(
  Valore = c(d1$A, d2$B, d3$C, d4$D),
  Gruppo = rep(c("A", "B", "C", "D"), times = c(length(d1$A), length(d2$B), length(d3$C), length(d4$D)))
)

modello_anova <- aov(Valore ~ Gruppo, data = dati)

summary(modello_anova)

#I risultati dell'ANOVA che hai fornito indicano quanto segue:
# 1. Df: Rappresenta i gradi di libertà, ovvero il numero di gruppi meno 1 (3) e il numero totale di osservazioni meno il numero di gruppi (16).
# 2. Sum Sq: Rappresenta la somma dei quadrati, che misura la varianza totale spiegata dalla variabile Gruppo e la varianza residua non spiegata.
# 3. Mean Sq: Rappresenta la media dei quadrati, calcolata dividendo la somma dei quadrati per i rispettivi gradi di libertà.
# 4. F value: Rappresenta il valore F calcolato, che confronta la varianza spiegata dal fattore Gruppo con la varianza residua.
# 5. Pr(>F): Rappresenta il valore p associato al test F, che indica la probabilità di ottenere un valore F uguale o maggiore di quello osservato, assumendo l'ipotesi nulla che non ci siano differenze tra i gruppi. Nel tuo caso, il valore p è 0.0335, che è inferiore al livello di significatività comune dello 0.05.
#### Interpretazione ####
#  I risultati indicano che c'è una differenza significativa tra almeno due dei quattro gruppi. 
#  L'ipotesi nulla che non ci siano differenze tra i gruppi può essere respinta. 
#  Tuttavia, per determinare quali gruppi sono significativamente diversi tra loro, potrebbe essere necessario eseguire ulteriori analisi post-hoc come il test di Tukey o il test di Scheffé.

# Esegui il test di Tukey come analisi post-hoc
tukey_result <- TukeyHSD(modello_anova)

# Visualizza i risultati del test di Tukey
print(tukey_result)

#DP-CS: Non è stata trovata una differenza significativa tra il gruppo "DP" e il gruppo "CS" (p-adj = 0.176).
#DP-CS-CS: Non è stata trovata una differenza significativa tra il gruppo "DP" e il gruppo "CS-CS" (p-adj = 0.923).
#NO-CS: Non è stata trovata una differenza significativa tra il gruppo "NO" e il gruppo "CS" (p-adj = 0.983).
#DP-CS-DP: È stata trovata una differenza significativa tra il gruppo "DP" e il gruppo "CS-DP" (p-adj = 0.034). La differenza media tra questi gruppi è di -1.533.
#NO-DP: Non è stata trovata una differenza significativa tra il gruppo "NO" e il gruppo "DP" (p-adj = 0.071).
#NO-DP-CS: Non è stata trovata una differenza significativa tra il gruppo "NO" e il gruppo "DP-CS" (p-adj = 0.993).
#In generale, i risultati indicano che ci sono alcune differenze significative tra i gruppi. 
#Tuttavia, per i confronti specifici menzionati sopra, non sono state trovate differenze significative, 
#ad eccezione del confronto tra il gruppo "DP" e il gruppo "CS-DP".
