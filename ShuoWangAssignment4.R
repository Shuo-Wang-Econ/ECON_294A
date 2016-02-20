# Shuo Wang Assignment 4

# 0 
print("Shuo Wang")
print(1505122)
print("swang103@ucsc.edu")


# 1 ************************************************************
flights<-read.csv(
  file = "/Users/shuowang/Documents/ECON_294A－RRR/Assignment_4/flights.csv",
  stringsAsFactors=FALSE)

planes<-read.csv(
  file = "/Users/shuowang/Documents/ECON_294A－RRR/Assignment_4/planes.csv",
  stringsAsFactors=FALSE)

weather<-read.csv(
  file = "/Users/shuowang/Documents/ECON_294A－RRR/Assignment_4/weather.csv",
  stringsAsFactors=FALSE)

airports<-read.csv(
  file = "/Users/shuowang/Documents/ECON_294A－RRR/Assignment_4/airports.csv",
  stringsAsFactors=FALSE)

# 2 *************************************************************
weather$date<-as.Date(weather$date)
flights$date<-as.Date(flights$date)

# 3 **************************************************************
flights.2a <- print(as.numeric(nrow(filter(flights,(dest=="SAN")|(dest=="OAK")))))
flights.2b <- print(as.numeric(nrow(filter(flights,(dep_delay>=60)&(arr_delay>=60)))))
flights.2c <- print(as.numeric(nrow(filter(flights,arr_delay>2*dep_delay))))

# 4 ************************************************************
# 1st 
dplyr::select(
  flights,
  ends_with("lay")
)

# 2nd
dplyr::select(
  flights,
  contains("del")
)

# 3rd
dplyr::select(
  flights,
  matches("_")
)

# 5 ************************************************************
# 5a
print(head(dplyr::arrange(flights,-dep_delay), n=5))

# 5b
print(flights%>%mutate(
  catch_upthemost=(dep_delay-arr_delay)
)%>%arrange(desc(catch_upthemost))%>%head(5))

# 6 *************************************************************
# 6a
print(flights %>% dplyr::mutate(speed = dist / (time/60))%>%arrange(desc(speed)) %>%head(5))

# 6b
print(flights %>% mutate(delta=dep_delay-arr_delay)%>%arrange(desc(delta))%>%head(5))

# 6c
print(flights %>% mutate(delta=dep_delay-arr_delay)%>%arrange(delta)%>%head(1))

# 7 *************************************************************
# 7a
flights.7a<-flights %>% mutate(delta=dep_delay-arr_delay) %>% group_by(carrier) %>%
  summarise (
    cancelled_sum = sum(cancelled),
    total_flights = n(),
    percent_cancelled= (cancelled_sum/total_flights),
    min_delta= min(delta, na.rm = T),
    quantile1 = quantile(delta, .25, na.rm = T),
    quantile2 = quantile(delta, .75, na.rm = T),
    mean_delta= mean(delta, na.rm = T),
    median_delta= median(delta, na.rm = T),
    quantile90 = quantile(delta, .90, na.rm = T),
    max_delta= max(delta, na.rm = T)
  )
print(flights.7a%>%arrange(desc(percent_cancelled))%>%head(1))

# b
print(
  day_delay <- dplyr::filter( summarize(
    group_by( dplyr::filter(
      flights,
      !is.na(dep_delay) ),
      date ),
    delay = mean(dep_delay), n = n()
  ),
  n > 10 )
)
# from this code, we can get the mean of depature delay on each date.

# rewrite
print(dplyr::filter(flights,!is.na(dep_delay))%>% group_by(date)%>%
        summarise(delay = mean(dep_delay),
          n = n())%>%filter(n>10))

# 8 *************************************************************
print(mutate(day_delay, difference_in_delay = delay-lag(delay)) 
      %>%arrange(desc(difference_in_delay))%>%head(5))

# 9 *************************************************************
# a
dest_delay<-flights %>% group_by(dest) %>%
  summarise (mean = mean(arr_delay, na.rm = T),number_flights=n())

airports<-select(airports,dest = iata, name = airport , city,state, lat, long)

dest_delay %>% tbl_df

df.9a<- airports%>% left_join(dest_delay,by="dest")
df.9a %>% arrange(desc(mean)) %>% head(5)

# b
df.9b<- airports%>%inner_join(dest_delay,by="dest")
# do not match

# c
df.9c<- airports%>%right_join(dest_delay,by="dest")
# I get 116 observations. No NA

# d
df.9d<- airports%>%full_join(dest_delay,by="dest")
# there are 3387 observations.

# 10 *************************************************************
hourly_delay <- flights %>%filter(!is.na(dep_delay)) %>%
  group_by(date,hour) %>%summarize(delay=mean(dep_delay),n= n()) %>%filter(n>10)

question10<-hourly_delay %>%inner_join(weather,by=c("date","hour"))%>%arrange(desc(delay)) %>%
  tbl_df

print(question10$conditions[1:5])

# 11 *************************************************************
# a
require(tidyr)
require(dplyr)

df <- data.frame(treatment = c("a", "b"), subject1 = c(3, 4), subject2 = c(5, 6))
df

df %>% gather(subject, value, -treatment) %>% mutate(subject = subject %>% substr(8,9)) %>% select(subject, treatment, value)

# b
df <- data.frame(
  subject = c(1,1,2,2),
  treatment = c("a","b","a","b"),
  value = c(3,4,5,6)
)
df

df %>% spread( key = subject, value = value) %>%rename(subject1 = `1`, subject2 = `2`)

# c
df <- data.frame(
  subject = c(1,2,3,4),
  demo = c("f_15_CA","f_50_NY","m_45_HI","m_18_DC"),
  value = c(3,4,5,6)
)
df

df%>%separate(demo, into = c('sex','age','state') , sep = '_')

# d
df <- data.frame(
  subject = c(1,2,3,4),
  sex = c("f","f","m",NA),
  age = c(11,55,65,NA),
  city = c("DC","NY","WA",NA),
  value = c(3,4,5,6)
)
df

df <- df %>% unite("demo", c(sex, age, city),sep = '.')
df[4,2] = NA
df
















