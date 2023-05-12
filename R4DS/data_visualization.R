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


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# What’s gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# blue needs to be specified outside of the aec argument


#Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
?mpg  
# Continuous:model, displ, year, cyl, cty, hwy
# categorical: manufacturer, model, trans, drv, fl, class

#Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, color = manufacturer))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, size = manufacturer))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, shape = manufacturer))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, color = manufacturer, 
                           shape = trans))
#What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, color = manufacturer, 
                           shape = manufacturer))
#What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, stroke = 1, ))

#What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, color = displ < 5))

# highlights True/False for < condition



ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

?mpg
# What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(~ year)
#What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
head(mpg)
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))+
    facet_grid(drv ~ cyl)
# no data   

#What plots does the following code make? What does . do?
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
#Take the first faceted plot in this section:
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? How might the balance change if you had a larger dataset?
  
 # Read ?facet_wrap. What does nrow do? What does ncol do? What other options control the layout of the individual panels? Why doesn’t facet_grid() have nrow and ncol arguments?
  ?facet_wrap
  #When using facet_grid() you should usually put the variable with more unique levels in the columns. Why?





