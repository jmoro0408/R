# install.packages("nycflights13")
library(nycflights13)
library(tidyverse)

flights
View(flights)

filter(flights, month == 1, day == 1)
jan1 <- filter(flights, month == 1, day == 1)
(dec25 <- filter(flights, month == 12, day == 25))
filter(flights, month == 11 | month == 12)
# 
# Find all flights that
# 
# Had an arrival delay of two or more hours

filter(flights,dep_delay >= 120 )

# Flew to Houston (IAH or HOU)
filter(flights, dest == "IAH" | dest == "HOU")
filter(flights, dest %in% c("IAH", "HOU"))

# Were operated by United, American, or Delta
filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL")
filter(flights, carrier %in% c("UA", "AA", "DL"))

# Arrived more than two hours late, but didn’t leave late
filter(flights, arr_delay >= 120 , dep_delay <=0)

# Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, dep_delay >= 60, (dep_delay - arr_delay > 30))

arrange(flights, year, month, day)
arrange(flights, desc(dep_delay))
sum(is.na(flights$dep_time))

select(flights, year, month, day)

# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

select(flights, time_hour, air_time, everything())

#What happens if you include the name of a variable multiple times in a select() call?
select(flights, time_hour, time_hour,time_hour)
# only 1 is returned

# What does the any_of() function do? 
?dplyr::any_of
# Why might it be helpful in conjunction with this vector?

vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, any_of(vars))
#Does the result of running the following code surprise you? 
# How do the select helpers deal with case by default? 
#   How can you change that default?
select(flights, contains("TIME"))


flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
) 
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
) 
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
) 

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))


by_day <- group_by(flights, year, month, day)
head(by_day)
head(flights)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)
head(delay)

delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))



