this_is_a_really_long_name <- 2.5


seq(1,10)

#Tweak each of the following R commands so that they run correctly:
library(tidyverse)

# ggplot(dota = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# fliter(mpg, cyl = 8)
# filter(diamond, carat > 3)
filter(mpg, cyl == 8)
filter(diamonds, carat > 3)


