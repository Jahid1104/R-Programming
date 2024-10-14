
#Load Libraries
library(tidyverse)
library(ggthemes)
library(multcompView)
library(dplyr)
library(readr)
library(ggplot2)

#Load your data set
data<- read.csv(file.choose())

#View your data and structure
head(data)
str(data)

#Set as factor, if needed
data$Hybrids = as.factor(data$Hybrids)
data$Replications = as.factor(data$Replications)

str(data)

head(iris)

############ANOVA#############
anova_result<- aov(Sepal.Length~Hybrids, data=data)

anova_result

######Post Hoc#######Tukey#######
tukey_a<- TukeyHSD(anova_result, conf.level = 0.95)
tukey_a

#######Compact letter display#########
cld<- multcompLetters4(anova_result,tukey_a)
print(cld)

#######Table with all factors######
a<- group_by(data, Hybrids) %>%
        summarise(mean = mean(PH, na.rm = T), sd=sd(PH)) %>%
        arrange(desc(mean))
a

#######Add letter in Table##########
cld <- as.data.frame.list(cld$Hybrids)
a$cld<- cld$Letters
print(a)

str(a)
a$mean = as.numeric(a$mean)
a$sd = as.numeric(a$sd)

ggplot(a, aes(Hybrids, mean))+
        geom_bar(stat = "identity", aes(fill = "white"), show.legend = F) +
        geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd), width = 0.05) +
        labs(x = "Title" , y = "title") +
        geom_text(label = cld, y=w+sd, vjust = -0.5) +
        ylim(0,100) +
        theme_few()

ggsave("barplot.png", width = 4, height = 4, dpi = 1000)