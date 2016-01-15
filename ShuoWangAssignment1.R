firstName <- "Shuo"
lastName <- "Wang"

print(
  paste(
    firstName,
    lastName
  )
)

studentID <- "1505122"
print(studentID)

# Question 1
library(foreign) #package with read.dta in it
df.dta<-read.dta(
  file="https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta"
)
#load data from .dta (STATA File)

df.csv <- read.csv("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")
#load data from CSV

df.td <- read.table(file="https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt")
#load data from Tab deliniated

load(url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_RData.RData"))
#load data from .RData
#this RData file is assigned the name "NHIS_2007_RData".

# Question 2
# NHIS_2007_dta.dta is 197KB.
# NHIS_2007_CSV.csv is 142KB.
# NHIS_2007_TSV.txt is 142KB.
# NHIS_2007_RData.RData is 46KB.

# NHIS_2007_RData.RData is the smallest.

# NHIS_2007_CSV.csv and NHIS_2007_TSV.txt have more characters, so they are bigger.
# NHIS_2007_RData.RData is Binary. And it is compressed. For txt and csv, they are ASCII. They are not compressed. So they are larger.

# Question 3
typeof(NHIS_2007_RData)
# the result is : [1] "list"

class(NHIS_2007_RData)
# the result is : [1] "data.frame"

# Question 4
df.dta<-read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")
print(str(df.dta))
# Apply and report str
# There are 1119754 observations and 30 variables.

min(df.dta["rw"],na.rm=TRUE)
max(df.dta["rw"],na.rm=TRUE)
mean(df.dta[["rw"]],na.rm=TRUE)
median(df.dta[["rw"]],na.rm=TRUE)

quantile(df.dta[["rw"]],na.rm=TRUE,0.25) #first quartile value
quantile(df.dta[["rw"]],na.rm=TRUE,0.75) #third quartile value

sum(is.na(df.dta["rw"])) # the number of NAs

# Question 5
v<-c(1,2,3,4,5,6,7,4,NULL,NA)
print(length(v))
# because "NULL" is nonexistent, it is ignored when we count the length

mean(v,na.rm=TRUE)
print(mean(v,na.rm=TRUE))
# Report mean ignoring the NA value.

# Question 6
x<-matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3, ncol = 3, byrow = TRUE) #Create the 3*3 matrix and call it x.

t(x) # find its transpose

eigen(x) #Find the eigenvalues and eigenvectors of x.

y<-matrix(c(1,2,3,3,2,1,2,3,0),nrow = 3, ncol = 3, byrow = TRUE) #Create the 3*3 matrix and call it y

solve(y) #Find the inverse of y.

solve(y) %*% y # Multiple y by its inverse.
# From linear algebra,this new matrix is called Identity Matrix.

# Question 7
diamonds <- data.frame(
  carat = c(5,2,0.5,1.5,5,NA,3),
  cut = c("fair","good","very good","good","fair","Ideal","fair"),
  clarity = c("SI1","I1","VI1","VS1","IF","VVS2",NA),
  price = c(850, 450,450,NA, 750, 980, 420)
     )
View(diamonds)

print(mean(diamonds$price,na.rm = TRUE))
# compute the mean price, which is "[1] 650".

mean(diamonds[diamonds$cut=="fair",]$price)
#the mean price of cut “fair”

mean(diamonds[diamonds$cut=="good",]$price,na.rm = TRUE)
#the mean price of cut “good”

mean(diamonds[diamonds$cut=="very good",]$price,na.rm = TRUE)
#the mean price of cut “very good”

mean(diamonds[diamonds$cut=="Ideal",]$price,na.rm = TRUE)
#the mean price of cut “Ideal”

median(diamonds[diamonds$carat>2&(diamonds$cut=="Ideal"|diamonds$cut=="very good"),]$price)
#the median price for diamonds with greater than 2 carats, and cut “Ideal” or “very good”
#we will get the answer "NA"



