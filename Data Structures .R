####  R Codes by Md Jahid Hasan Jone
#### Data Structures

###1.	Vector (ordered collection of same data type)
X = c(1, 3, 5, 7, 8)
print(X)


###2.	List
Id = c(1, 2, 3, 4)
Name = c("A", "B", "C", "D")
number = 4
List = list(Id, Name, number)
print(List)


###3.	dataframe
Name = c("A", "B", "C")
Language = c("Bangla", "English", "Arabic")
Age = c(20, 25, 15)
df = data.frame(Name, Language, Age)
print(df)


###4.	Matrix
A = matrix (
        c(1, 2, 3, 4, 5, 6, 7, 8, 9), 
        nrow = 3, ncol = 3, 	 
        byrow = TRUE		# By default matrices are in column-wise order 
)
print(A)


###5.	Array
A = array(
        c(1, 2, 3, 4, 5, 6, 7, 8),
        dim = c(2, 2, 2)					 
)
print(A)


###6.	Factors
fac = factor(c("Male", "Female", "Male",
               "Male", "Female", "Male", "Female"))
print(fac)


# Data frame formation

ID <- c(1:5)
Name <-c ("A","B","C","D","E")
Date_of_Birth <-as.Date (c("1999-12-16","1999-12-16","1999-12-16","1999-12-16","1999-12-16"))

df<-data.frame(ID,Name,Date_of_Birth)
df
Student_data <- df

library("writexl")
library(writexl)

write_xlsx(Student_data,"Student_data.xlsx")
Student_data

#Data frame import

library(readxl)

library(readxl)
Student_date <- read_excel("Student_date.xlsx")# copy the code from import promt
View(Student_date)