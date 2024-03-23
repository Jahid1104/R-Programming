### Analysis of Variance and Tukey Test

#Read your data table containg data for env, gen, rep & traits
a <- read.csv(file.choose())
head(a)
a

##define as factor
a$ENV <- factor(a$ENV, levels = unique (a$ENV))
a$REP <- factor(a$REP, levels = unique (a$REP))
a$GEN <- factor(a$GEN, levels = unique (a$GEN))
str(a)

summary(a)

levels(a$ENV)
levels(a$REP)
levels(a$GEN)

plot(a)
plot(a$DF~a$DM)
hist(a$PH)
boxplot(a$PL)


#Analysis of Variance
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

ENV = a$ENV
GEN = a$GEN
DF  = a$DF
DM  = a$DM
PH  = a$PH 
PPP = a$PPP 
SPP = a$SPP  
PL  = a$PL
HSW = a$HSW
GY  = a$GY

#compare mean
mean(DF)
mean(DF, na.rm = T)
mean_DF<- a[is.na(a$DF), "DF"]
mean_DF

tapply(PH, ENV, mean)


boxplot(GY~ENV)

aov(DF~ENV, data = a)
aov(DF~GEN, data = a)
aov(DF~ENV*GEN, data = a)
b = aov(DF~ENV*GEN, data = a)
summary(b)

aov(PL~ENV, data = a)
aov(PL~GEN, data = a)
aov(PL~ENV*GEN, data = a)
c = aov(PL~ENV*GEN, data = a)
summary(c)


d <- group_by(a, ENV, GEN)%>% 
        summarise(mean = mean(DF, na.rm = T), sd = sd(DF), n=n()) %>%
        arrange(desc(mean))
print(d)
View(d)


#Tukey
tukey_a<-TukeyHSD(b, conf.level = 0.95)
print(tukey_a)

cld_DF<- multcompLetters4(b, tukey_a)
print(cld_DF)

cld_DF<- as.data.frame.list(cld_DF$`ENV:GEN`)
View(cld_DF)


d$Tukey <- cld_DF$Letters
View(d)

write.csv(d, "mean, sd, letters.csv")
