# generating frequency table of 
# the factor vector
freq <- table(M2Data$Market)
print ("Frequency DataFrame")

# converting the table into dataframe
freq_df <- as.data.frame(freq)

knitr::kable(freq_df, col.names = c('Markets', 'Frequency'), align = 'c', caption = "An example table caption.", table.attr = "class=\"striped\"",
             format = "html")



plot(freq_df, 
     col = brewer.pal(12, "Set3"),
     main = paste("Bar Plot for Market"),
     xlab = paste("Market"),
     ylab = paste("Frequency"),
     ylim= c(0, 200))


freq <- table(M2Data$Market)
print ("Frequency DataFrame")
#knitr function


BarGraph = barplot(freq_Market,
                   col = brewer.pal(12, "Set3"),
                   main = paste("Bar Plot for Market"),
                   xlab = paste("Market"),
                   ylab = paste("Frequency"),
                   ylim= c(0, 400), Horizontal = FALSE)

text(y=freq_Market, 
     BarGraph, 
     freq_Market, 
     cex=0.8, 
     pos = 3)


boxplot(M2Data$Region~M2Data$Profits)


# Use par() code. 
# Add mfcol() to organize graphs in a matrix of 2 rows and 1 column 
# Add mai=c() to control margins inside graphs 
# Add mar=c() to control margins outside graphs 
par(mfcol=c(2,1), 
    mai=c(2, 2, 3, 3), 
    mar=c(2,2,1,2)) 

# Present a box plot of all profits 



# Present a histogram of all profits 
hist(freq_LATAM, 
     main = "Histogram for Profits",
     xlab = paste("Profits"),
     col = brewer.pal(12, "Set3"),
     las = 1)

## Vertical line and text for the mean for Histogram
abline(v = mean(freq_LATAM),
       col = "blue",
       lwd = 2)

text(x=mean(freq_LATAM),
     y = 180,
     paste("Mean:", round(mean(freq_LATAM),1),""),
     col = "blue",
     cex = 0.8,
     pos = 4)
