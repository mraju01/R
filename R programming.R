

library(tidyverse)
data()
View(starwars)

starwars %>% 
  filter (height >150 & mass <200) %>% 
  mutate(height_in_meters = height/ 100) %>% 
  select(height_in_meters, mass) %>% 
  arrange(mass) %>% 
  #view()
  plot()



# Explore
########

#Data Structure and tyepe of var9bales
view(msleep)

glimpse(msleep)

head(msleep)

class(msleep$name)


length(msleep)
#No of Variables

length(msleep$name)
#no of observations

names(msleep)
#to get all variables
# helps in cutting and pasting into the code, so we don't make sp[elling mistake

unique(msleep$vore)
#to get all the unique categories in the variobale

complete.cases(msleep)
#to get all the mssing values as False

missing = !complete.cases(msleep)
#to get all the mssing values as True

msleep [missing, ]


#Clean
#######


# Select Varibales
#####################

starwars%>% 
  select(name, height, mass)

starwars%>% 
  select(1:3)

#
starwars%>% 
  select(ends_with("color"))

#Contains
#starts_with


#Changing Variable Order
########################

starwars %>% 
  select(name, height, mass, everything())


#Changing Variable Name
##########################

starwars %>% 
  rename("Character"= "name") %>% 
  head()


#Changing Variable Type
##########################

class(starwars$hair_color)

#starwars$hair_color = as.factor(starwars$hair_color)

starwars$hair_color = as.numeric(starwars$hair_color)

class(starwars$hair_color)

## Using Tidy Verse
starwars %>% 
  mutate(hair_color = as.character(hair_color))%>% 
  glimpse()



#Changing factor level
######################

df = starwars
df$sex = as.factor(df$sex)

levels(df$sex)


df = df %>% 
  mutate(sex = factor(sex, levels = c("male", "female", "hermaphroditic", "none"
                                      )))
levels(df$sex)


df$name = as.factor(df$name)
levels(df$name)

#Why to use factor in R 

#Categorical variables in R are stored into a factor. Let’s check the code below to convert a character variable into a factor variable in R. Characters are not supported in machine learning algorithm, and the only way is to convert a string to an integer



#Filter Rows
######################

starwars %>% 
  select(mass, sex) %>% 
  filter (mass <55 & sex=="male")


#Recode Data
#################
# To chanh the data in the datafrmae


starwars %>% 
  select(sex) %>% 
  mutate(sex =  recode( sex,  "male" = "man", 
                              "female" = "Woman"))



#Dealing withj Missing Data
#################

mean(starwars$height)

#>NA


#na.rm = TRUE 
# to remove the missing data from the columns
mean(starwars$height, na.rm= TRUE)


#Dealing withj Duplicates
#################

Names <-  c("Peter","John","Andrew","Peter1")

Age  <-   c(23, 54, 36, 23)

friends <- data.frame(Names, Age)

friends %>%
  distinct()

#Note: Only works well with numerical varibale


#Manipulate
###############

#Create or change a variable

starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name, height, height_m)

#Conditonal change(if_else)

starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name, height, height_m) %>% 
  mutate(tallness =  if_else(height_m < 1, "short", "tall"))

#Reshape data with pivot wider
library(gapminder)

#Datasets
view(gapminder)

data = select(gapminder, country, year, lifeExp)
view(data)

wide_data = data %>% 
  pivot_wider(names_from = year,  values_from = lifeExp)

view(wide_data)


#Reshape data with pivot longer

long_data = wide_data %>% 
  pivot_longer(2:13, 
               names_to = "year",
               values_to = "lifeExp")

view(long_data)

# Describe the data
###################

view(msleep)

#Range/Spread

min(msleep$awake)

max(msleep$awake)

range(msleep$awake)

IQR(msleep$awake)


#Measure of Central tendency
mean(msleep$awake)

median(msleep$awake)

mode(msleep$awake)


#Variance
var(msleep$awake)

#for single variable
summary(msleep$awake)


# for multiple variables
msleep %>% 
  select(awake, sleep_total) %>% 
  summary()


#summarize your data
msleep %>% 
  drop_na(vore) %>%  ## drop NA Values
  group_by(vore) %>% 
  summarise(Lower  = min(sleep_total),
            Average= mean(sleep_total),
            Upper =  max(sleep_total),
            Difference = max(sleep_total) -min(sleep_total)) %>% 
  arrange(Average) %>% 
  view()


#Create Table
table(msleep$vore)


msleep %>% 
  select(vore, order) %>% 
  filter(order %in% c ("Rodentia", "Primates")) %>% 
  table()


## Visuliza the data
######################


#The grammar of graphics
  #data
  #mapping
  #geometery


#Bar Plots

library(ggplot2)
ggplot(data = starwars,
       mapping = aes(x= gender)) +  ## Remember to use the + Operator
  geom_bar()


#Histograms


#We can use %>% to perform some action before plotting like mutate, filter
starwars %>% 
  drop_na(height) %>% 
  ggplot(mapping = aes(x=height)) + ## Mapping 
  geom_histogram()

#Boxplots
starwars %>% 
  drop_na(height) %>% 
  ggplot(mapping = aes(x= height)) +
  geom_boxplot(fill= "steelblue") +
  theme_bw()+
  labs(title= "Boxplot of heights",
       x= "Height of characters")

#Density Plots
starwars %>% 
  drop_na(height) %>% 
  filter(sex %in% c("male", "female")) %>% 
  ggplot(mapping = aes(x=height, 
                       color = sex, 
                       fill = sex)) +
  geom_density(alpha = 0.2) +
  theme_bw()
  

#Scatter Plots
starwars %>% 
  filter(mass<200) %>% 
  ggplot(aes(x= height, y = mass,  color = sex)) +
  geom_point(size = 5, alpha = 0.5) +
  theme_minimal() +
  labs(title = "Heights and Mass by Sex")

#Smoothed Mode

starwars %>% 
  filter(mass<200) %>% 
  ggplot(aes(x= height, y = mass,  color = sex)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth() +
  facet_wrap(~sex) +
  theme_bw() +
  labs(title = "Heights and Mass by Sex")






















