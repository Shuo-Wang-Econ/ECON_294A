# Shuo Wang Assignment 3

# 0 
print("Shuo Wang")
print(1505122)
print("swang103@ucsc.edu")

### 1
library(foreign)
df.ex <- read.dta(
  "https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta"
)
# Load the file as a data frame
class(df.ex)

### 2
require(dplyr)
df.ex.2 <- df.ex %>%
  dplyr::filter(
    year == 2013 & month == 12
  )
print(nrow(df.ex.2))  # Print the number of observations that belong to the last month of 2013.

df.ex.2 <- df.ex %>%
  dplyr::filter(
    year == 2013 & (month == 7 | month == 8 | month == 9)
  )
print(nrow(df.ex.2)) # Print the number of observations in Summer 2013. 

### 3
df.ex.3a <- dplyr::arrange(
    df.ex,
    year, month
  )

### 4
df.ex.4a <- dplyr::select(
  df.ex,
  year,age
)   # a new data frame with only columns year through age.

df.ex.4b <- dplyr::select(
  df.ex,
  year, month, starts_with("i")
)   # a new data frame with only columns year, month, and columns that start with i.

print(unique(df.ex$state)) # print the distinct set of values of state in the original df.ex

### 5
stndz <- function(x){
  (x - mean(x, na.rm = T))  /  sd(x, na.rm = T)
}

nrmlz <- function(x){
  (x - min(x, na.rm = T))  /  (max(x, na.rm = T) - min(x, na.rm = T))}

df.ex.5a <- df.ex %>% mutate(
    rw.stndz = stndz(rw),
    rw_nrmlz = nrmlz(rw)
  ) 

df.ex.5b <- df.ex %>% group_by(year,month) %>% mutate(
  rw.stndz = stndz(rw),
  rw_nrmlz = nrmlz(rw),
  count = n()
)

### 6
df.ex.6 <- df.ex %>% group_by(year,month,state) %>% summarise(
  rw_min = min(rw,na.rm = T),
  rw_1stQnt = quantile(rw, 0.25,na.rm = T),
  rw_mean = mean(rw, na.rm = T),
  rw_median = median(rw, na.rm = T),
  rw_3rdQnt = quantile(rw, 0.75,na.rm = T),
  rw_max = max(rw,na.rm = T),
  rw_count = n()
)

high_mean_rw <- df.ex %>% dplyr::group_by(year, month, state) %>% dplyr::summarise(
  rw_mean = mean(rw, na.rm = T)
)

highest_mean_rw <- dplyr::filter(
  high_mean_rw,
  rw_mean==max(highest_mean_rw$rw_mean)
  )

print(highest_mean_rw)

### 7
df.ex$state.char <- as.character(df.ex$state)
df.ex.7a <- arrange(df.ex,-desc(year),-desc(month),desc(state.char))













