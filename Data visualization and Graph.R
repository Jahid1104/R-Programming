#Data visualization and Graphs

a <- runif(20, 10, 50)
b <- runif(20, 50, 100)
a
b

plot(a, type = "o" , frame = T ,
     main = "Title" , sub = "Subtitle" ,
     xlab = "Name of X axis" , ylab = "Name of Y axis" ,
     xlim = c(1,20) , ylim = c(1, 100) ,
     col = "blue" ,
     pch = 2, lty = 2, lwd = 1,                                    
     cex = 1, cex.lab = 1.2, cex.main = 2.2, cex.sub = 1.3)

lines(b, type = "o", col = "red", pch = 2)

# xlab & ylab = axis name
# xlim & ylim = axis limit
# pch = point type, lty = line type, lwd = line width
# cex = point size, cex.lab = label size, cex.main = title size, cex.sub = subtitle size

#double parameter
plot (a, b, 
      type = "o" , frame = T ,
      main = "Title" , sub = "Subtitle" ,
      xlab = "Name of X axis" , ylab = "Name of Y axis" ,
      xlim = c(1,50) , ylim = c(40, 100) ,
      col = "blue" ,
      pch = 2, lty = 2, lwd = 1,                                    
      cex = 1, cex.lab = 1.2, cex.main = 2.2, cex.sub = 1.3)

#histogram
hist(a,
     main= "Chart Title", sub = "subtitle" ,
     xlab="a", ylab = "frequency" , 
     breaks = 18 ,
     lty = 1, lwd = 2,                                    
     cex.lab = 1, cex.main = 2, cex.sub = 1.2, 
     col="gray" , border = "red" ,
     prob= F)

# lty = bar border type, lwd = axis bar width
# xlim and ylim can be added


#boxplot
boxplot(a,
        main= "Chart Title", sub = "subtitle" ,
        xlab="a", ylab = "frequency" , 
        lty = 1, lwd = 1,                                    
        cex.lab = 1, cex.main = 1.7, cex.sub = 1.2, 
        col="gray" , border = "red" )

# lty = box border type, lwd = box border width

barplot(a,
        main= "Chart Title", sub = "subtitle" ,
        xlab="a", ylab = "frequency" ,
        lty = 1, lwd = 1,                                    
        cex.lab = 1, cex.main = 2, cex.sub = 1.2, 
        col="gray" , border = "red")

# lty = y axis bar type, lwd = y axis bar width


#Pie Charts
c = c("Dhaka", "Cumilla", "Bogura")
d = c(50, 30, 20)
pie (d,
     labels = c, 
     main= "Chart Title", 
     xlab="a", 
     lty = 1, lwd = 2,                                    
     cex.lab = 1, cex.main = 2, cex.sub = 1.2, 
     col= rainbow (3), border = "red")

pct = round (d / sum (d) * 100)
new_labels = paste (c," (", pct, "%)", sep = "")

pie (d,
     labels = new_labels,
     main= "Chart Title", 
     xlab="a", 
     lty = 1, lwd = 2,                                    
     cex.lab = 1, cex.main = 2, cex.sub = 1.2, 
     col= rainbow (3), border = "red")

library(plotrix)
pie3D (d,
     labels = new_labels,
     main= "Chart Title", 
     lty = 1, lwd = 2,                                    
     cex.lab = 1, cex.main = 2, cex.sub = 1.2, 
     explode = 0.1,
     col= rainbow (3), border = "red")
