
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

  # left
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy))
  
  # right
  ggplot(data = mpg) + 
    geom_smooth(mapping = aes(x = displ, y = hwy))

  ggplot(data = mpg) + 
    geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class))

  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    geom_smooth(mapping = aes(x = displ, y = hwy))

  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth()

  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point(mapping = aes(color = class)) + 
    geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
  #se = standard error bars
  
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point()+
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy), show.legend = FALSE)+
  geom_point()+
  geom_smooth(mapping = aes(group = drv),se = FALSE)

?geom_smooth

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop), group = 1))

?geom_bar


ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
?stat_summary
  

#What is the default geom associated with stat_summary()? How could you rewrite the previous plot to use that geom function instead of the stat function?
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(data = diamonds)+  
  geom_pointrange(     
    mapping = aes(x = cut, y = depth),     
    fun.min = min,     
    fun.max = max,     
    fun = median,      
    stat = "summary"   )

 # What does geom_col() do? How is it different to geom_bar()?
  ?geom_col

ggplot(data = diamonds)+
  geom_col(mapping = aes(x = cut, y = depth))
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut))
#geom_bar produces a bar chart with the count of occurances
 
#What variables does stat_smooth() compute? 
#What parameters control its behaviour?
head(diamonds)
?stat_smooth
ggplot(data = diamonds, mapping = aes(x = depth, y = carat)) +
  stat_smooth()+
  geom_point(alpha = 0.5)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))


ggplot(data = diamonds, mapping = aes(x = depth, y = carat, colour = clarity)) + 
  geom_point(fill = NA, position = "identity")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


# 1 What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()
# add jitter 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")


#What parameters to geom_jitter() control the amount of jittering?
?geom_jitter()
#width and height
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter(width = 0.5, height = 0.5)

 # Compare and contrast geom_jitter() with geom_count().
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()
#geom_Count changes the size of the plot points depending on how frequntly
#they occure

#What’s the default position adjustment for geom_boxplot()?
ggplot(data = mpg, mapping = aes(x = manufacturer, y = cty)) + 
  geom_boxplot()
?geom_boxplot
#Create a visualisation of the mpg dataset that demonstrates it.
head(mpg)

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()


#Turn a stacked bar chart into a pie chart using coord_polar().
ggplot(data = mpg, mapping = aes(x = manufacturer, y = cty, fill = class))+
  geom_bar(stat = 'identity', position = 'stack')+
  coord_flip()+
  coord_polar()
#What does labs() do? Read the documentation.
?labs
#adds/edits plot labels

#What’s the difference between coord_quickmap() and coord_map()?
?coord_quickmap
?coord_map

# coord_map(): This function is used to create maps with a 
# specific map projection. It transforms the data to a specified 
# coordinate reference system (CRS) using the mapproject package. 
# The resulting plot will have accurate distances and shapes, 
# but the aspect ratio may be distorted. coord_map() is commonly 
# used when creating thematic maps, where preserving accurate 
# geographical representation is important.

# coord_quickmap(): This function is used to create maps with a quick, 
# approximate map projection. It aims to provide a visually pleasing and 
# distortion-free representation of the data on a flat surface without 
# the need for extensive calculations. It preserves the aspect ratio of 
# the data, making it useful for exploratory data analysis or 
# when the exact geographical accuracy is less important. coord_quickmap() 
# is computationally efficient and suitable for large datasets.


#What does the plot below tell you about the relationship between 
#city and highway mpg? Why is coord_fixed() important? 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() 
  # coord_fixed()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() 

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
#coord_fixed maintains the aspect ratio of the plot 
#What does geom_abline() do?
?geom_abline
# geom_abline adds a reference line diagonally across the plot where x = y


