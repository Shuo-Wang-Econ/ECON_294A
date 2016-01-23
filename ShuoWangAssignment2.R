# Assignment 2

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Question 0

ShuoWangAssignment2 <- list(
  firstName = "Shuo",
  lastName  = "Wang",
  email     = "swang103@ucsc.edu",
  studentID = 1505122
)

# Question 1

# <- get(load(...)) is a handy way to load an .RData file and rename it at the same time
diamonds <- get(  
  load(
    file = url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/diamonds.RData")
  )
)

ShuoWangAssignment2$s1a <- nrow(diamonds)
ShuoWangAssignment2$s1b <- ncol(diamonds)
ShuoWangAssignment2$s1c <- names(diamonds)
ShuoWangAssignment2$s1d <- summary(diamonds$price)

# Question 2
NHIS <- read.table(
  file="https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt",
  header = T)
#load data from the tab-separated file

ShuoWangAssignment2$s2a <- nrow(NHIS)
ShuoWangAssignment2$s2b <- ncol(NHIS)
ShuoWangAssignment2$s2c <- names(NHIS)
ShuoWangAssignment2$s2d <- mean(NHIS$weight,na.rm=TRUE)
ShuoWangAssignment2$s2e <- median(NHIS$weight,na.rm=TRUE)

hist(NHIS$weight)
table(NHIS$weight)
NHIS$weight2 <- ifelse(NHIS$weight >= 996, 
                       yes=NA,
                       no=NHIS$weight)

ShuoWangAssignment2$s2f <- mean(NHIS$weight2,na.rm=TRUE)
ShuoWangAssignment2$s2g <- median(NHIS$weight2,na.rm=TRUE)
ShuoWangAssignment2$s2h <- summary(NHIS[NHIS$SEX==2,]$weight2)
ShuoWangAssignment2$s2i <- summary(NHIS[NHIS$SEX==1,]$weight2)

# Question 3
vec <- c(letters,LETTERS)
ShuoWangAssignment2$s3a <- vec[seq(2,52,by=2)]
ShuoWangAssignment2$s3b <- paste(vec[c(45,8,21)], collapse="")

arr <- array(c(letters,LETTERS), dim = c(3,3,3))

ShuoWangAssignment2$s3c <- arr[1:3,1,2]
ShuoWangAssignment2$s3d <- arr[2,2,1:3]
ShuoWangAssignment2$s3e <- paste(arr[1,1,3],arr[2,3,1],arr[3,1,3], sep = "")

# Question 4
library(foreign)
org_example.dta<-read.dta("/Users/shuowang/Downloads/Econ 217/Homework1/org_example.dta")
View(org_example.dta)
org<-org_example.dta
ShuoWangAssignment2$s4-aggregate(org$rw, na.rm=TRUE,list(year = org$year, month=org$month, educ=org$educ), mean)

save(ShuoWangAssignment2,
     file = "/Users/shuowang/Documents/ECON_294A－RRR/ECON_294A/ShuoWangAssignment2.RData")
