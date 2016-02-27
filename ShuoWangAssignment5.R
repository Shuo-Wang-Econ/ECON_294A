# Shuo Wang Assignment 5

# 0 
print("Shuo Wang")
print(1505122)
print("swang103@ucsc.edu")

# 1a **********************************************************************
library(ggplot2)
d_1a<-ggplot(diamonds,aes(x*y*z,price))+scale_x_log10()+scale_y_log10()
d_1a+geom_point(aes(size=carat, colour=clarity), alpha=0.3)

# 1b **********************************************************************
d_1b<-ggplot(diamonds, aes(carat, ..density..))+geom_histogram(aes(fill=clarity),bins=25)
d_1b+facet_grid(cut ~ .)+stat_bin()

# 1c **********************************************************************
d_1c<-ggplot(diamonds,aes(cut,price))+geom_violin(trim=FALSE)+geom_jitter(alpha=0.011)
d_1c+geom_jitter(alpha=0.02)

# 2a **********************************************************************
library(foreign)
require(dplyr)
org_example<-read.dta(file="/Users/shuowang/Downloads/Econ 217/Homework1/org_example.dta")

org_example2<-org_example %>%
  group_by(year,month) %>%
  summarise(
    rw.med=median(rw, na.rm=T),
    rw.90=quantile(rw,0.9,na.rm=T),
    rw.10=quantile(rw,0.1,na.rm=T),
    rw.25=quantile(rw,0.25,na.rm=T),
    rw.75=quantile(rw,0.75,na.rm=T)
  ) %>%
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = as.Date(date, format = "%Y-%m-%d")
  )

ggplot(
  org_example2,
  aes(
    x=date,y=rw.med
  )
) +
  geom_line() +
  geom_ribbon(aes(ymin=rw.10,ymax=rw.90),alpha=0.2) +
  geom_ribbon(aes(ymin=rw.25,ymax=rw.75),alpha=0.5)

# 2b **********************************************************************
org_example3<-org_example %>%
  group_by(year,month,educ) %>%
  summarise(
    rw.med=median(rw, na.rm=T),
    rw.90=quantile(rw,0.9,na.rm=T),
    rw.10=quantile(rw,0.1,na.rm=T),
    rw.25=quantile(rw,0.25,na.rm=T),
    rw.75=quantile(rw,0.75,na.rm=T)
  ) %>%
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = as.Date(date, format = "%Y-%m-%d")
  )

ggplot(
  org_example3,
  aes(x=date,y=rw.med,colour=educ)
) +
  geom_line() 
  





