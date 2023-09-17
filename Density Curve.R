
# R Programming (Basic) by Md. Jahid Hasan Jone
# Density Curve


# load your dataset and renamed it data, iris data is used here
data <- iris

head(data) # first 6 observations
tail(data) # last 6 observations

str(data) # structure of dataset


# Basic Density plot
plot(density(data$Sepal.Length),
     frame = F, col = "blue", main = "Density plot", xlab = " ") 
#xlab is blank to remove x axis title




#By ggplot2
library(ggplot2)

ggplot(data) +
        aes(x = Sepal.Length) +
        geom_density(col = "blue", fill = "lightblue")


# Add mean line
ggplot(data) +
        aes(x = Sepal.Length) +
        geom_density(col = "blue", fill = "lightblue")+
        geom_vline(aes(xintercept=mean(Sepal.Length)),
              color="black", linetype="dashed", linewidth=1)

#To remove background color and grid
ggplot(data) +
        aes(x = Sepal.Length) +
        geom_density(col = "blue") + 
        theme_bw() + theme(panel.border = element_blank(), 
                           panel.grid.major = element_blank(), 
                           panel.grid.minor = element_blank(), 
                           axis.line = element_line(colour = "black"))



#Multiple Density Curve

#Load data / create a data frame with your data
a <- data.frame (data$Sepal.Length, data$Petal.Length)


library(reshape)
#convert from wide format to long format
a1 <- melt(a)
a1


ggplot(a1, aes(x=value, fill=variable)) +
        geom_density(alpha=.25) # alpha is transparency
