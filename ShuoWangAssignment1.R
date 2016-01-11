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

#1
library(foreign) #package with read.dta in it
df.dta<-read.dta(
  file="https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta"
)
#load data from .dta (STATA File)


