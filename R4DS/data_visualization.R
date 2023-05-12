install.packages("tidyverse")
library(tidyverse)

head(ggplot2::mpg)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)
 # How many rows are in mpg? How many columns?
nrow(mpg)
ncol(mpg)
# 234, 11
  #What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
# drivetrain
#Make a scatterplot of hwy vs cyl.
ggplot(data = mpg) +
  geom_point(mapping = (aes(x = hwy, y = cyl)))


#What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) +
  geom_point(mapping = (aes(x = class, y = drv)))
