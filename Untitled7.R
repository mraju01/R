data("ChickWeight")

Diets = table(ChickWeight$Diet)

plot1 = barplot (Diets,
                 xlim = c(0,250) ,
                 las = 1,
                 horiz = T,
                 ylab = "Diet Tve",
                 xlab = "Frequency",
                 col = c("#F52222", "#26CBA5", "#5177DF", "#EEDC3B"))
text(Diets, plot1, Diets, cex = 0.8, pos=4)