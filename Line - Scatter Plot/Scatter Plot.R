
# Basic R Programming by Md. Jahid Hasan Jone

################################################################################
################################ Scatter Plot ################################## 
################################################################################


######################### R base scatter plot: plot() ##########################
################################################################################

#Load data
x <- mtcars$wt
y <- mtcars$mpg

# Plot with main and axis titles
# Change point shape (pch) and remove frame.
plot(x, y, main = "Main axis title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 10, frame = FALSE)

# Add regression line
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 25, frame = FALSE)
abline(lm(y ~ x, data = mtcars), col = "black")


# Add loess fit
plot(x, y, main = "Main title",
     xlab = "X axis title", ylab = "Y axis title",
     pch = 10, frame = FALSE)
lines(lowess(x, y), col = "blue")


################## Enhanced scatter plots: car::scatterplot() ##################
################################################################################

install.packages("car")

library("car")
scatterplot(wt ~ mpg, data = mtcars)

#The plot contains:
#the points, the regression line (in green), the smoothed conditional spread (in red dashed line),the non-parametric regression smooth (solid line, red)

# Suppress the smoother and frame
scatterplot(wt ~ mpg, data = mtcars, 
            smooth = FALSE, grid = FALSE, frame = FALSE)

# Scatter plot by groups ("cyl")
scatterplot(wt ~ mpg | cyl, data = mtcars, 
            smooth = FALSE, grid = FALSE, frame = FALSE)


############################### 3D scatter plots ###############################
################################################################################

# Prepare the data set
x <- iris$Sepal.Length
y <- iris$Sepal.Width
z <- iris$Petal.Length
grps <- as.factor(iris$Species)

# Plot
library(scatterplot3d)
scatterplot3d(x, y, z, pch = 16)

# Change color by groups
# add grids and remove the box around the plot
# Change axis labels: xlab, ylab and zlab
colors <- c("#000000", "#E69F00", "#56B4E9")
scatterplot3d(x, y, z, pch = 19, color = colors[grps],
              grid = TRUE, box = FALSE, xlab = "Sepal length", 
              ylab = "Sepal width", zlab = "Petal length")

# 3D Scatterplot with Coloring and Vertical Lines and Regression Plane
attach(mtcars)
s3d <-scatterplot3d(wt,disp,mpg, pch=16, highlight.3d=TRUE,
                    type="h", main="3D Scatterplot")
fit <- lm(mpg ~ wt+disp)
s3d$plane3d(fit)


############################## Scatterplot Matrix ##############################
################################################################################

# Basic Scatterplot Matrix
pairs(~mpg+disp+drat+wt,data=mtcars,
      main="Simple Scatterplot Matrix")


# Scatterplot Matrices from the car Package
library(car)
scatterplotMatrix(~mpg+disp+drat+wt|cyl, data=mtcars,
                   main="Three Cylinder Options")


# Scatterplot Matrices from the glus Package
install.packages("gclus")
library(gclus)
dta <- mtcars[c(1,3,5,6)] # get data
dta.r <- abs(cor(dta)) # get correlations
dta.col <- dmat.color(dta.r) # get colors
# reorder variables so those with highest correlation
# are closest to the diagonal
dta.o <- order.single(dta.r)

cpairs(dta, dta.o, panel.colors=dta.col, gap=.5,
       main="Variables Ordered and Colored by Correlation")


# High Density Scatterplot with Binning
install.packages("hexbin")
library(hexbin)
x <- rnorm(1000)
y <- rnorm(1000)
bin<-hexbin(x, y, xbins=50)

plot(bin, main="Hexagonal Binning")