#Software Carpentry 2018-05-11 
#----------------------------------------#
#----------------------------------------#

#Conditional Statments, fucntion, and ggplot

#----------------------------------#
#Conditional Statement

number <- 37
#{curly brace!}

if (number > 100){ #if condition true
  print("greater than 100") #if true perform this function
}else{
  print("less than 100") #if false perform the next fucntion
}
print("finished checking") #print once the statment has been reviewed/completed

#comparison operators

# greater than  >, >=
# less than <, <= equals on the right hand side
# equal to ==
# not equal to !=
# 
number <- 80
if (number > 100){ #if condition true
  print("greater than 100") #if true perform this function
}
number <- 150
if (number > 100){ #if condition true
  print("greater than 100") #if true perform this function
}

# ee if example

if (number > 0){
    print(1)
} else if (number <0){
  print(-1)
} else {
  print(0)
}

# combing tests
number1 <- -15
number2 <- -40

if(number1 >= 0 & number2 >= 0){ #& is a combine
  print("both numbers are positive")
} else{
  print("at least one value is negative")
}

#'or'
#'
#'
if (number1 >= 0 | number2 >= 0){
  print("at least one is positive")
} else{
  print("both numbers are negative")
}


#Creating and using fucntion


fahr_to_kelvin <- function(temp){
  kelvin <- ((temp - 32) * (5/9)) +273.15
  return(kelvin)
}
# nothing will happen in console, but you will see in environment under function
# inside the curly braces is the body
#we dont need to run this again all we need to do is type 

fahr_to_kelvin(32) #freezing point
fahr_to_kelvin(212) #boiling point

#another conversion kelvin to celisus

kelvin_to_celsius <- function(temp){
  celsius <- (temp - 273.15)
  return(celsius)
}

kelvin_to_celsius(273.15)
kelvin_to_celsius(0)

#variable scope means that any variables we define within the fucntion stay within the function. Therefore you cant overwirte items in your code. test this by writing out celiusu it wont be found
#dont need to write returen, you can just leave the variable name

#mixing and match, combinging fucntion together

#make a fucntion to combine fahr to celsius

fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}

fahr_to_celsius(32)

#can also just nest function

kelvin_to_celsius(fahr_to_kelvin(32))

celsius_to_fahr <- function(temp_c){
  temp_f <- ((temp_c * 9 / 5) +32)
  return(temp_f)
}

celsius_to_fahr(0)

#making ggplot figures~----------------------#

library(ggplot2)
gap <- read.csv('data/gapminder-FiveYearData.csv')
head(gap)
str(gap)


plot(x = gap$gdpPercap, y = gap$lifeExp) #very intersting plot!


#ggtree is another idea
#grammar of graphic -----------------------------------------------------------#

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp)) +
    geom_point()      #add a layer

ggplot(data = gap, aes(x = year, y = lifeExp)) +
  geom_point()      #add a layer

#doesnt seem like the best7 way to do this. 

ggplot(data = gap, aes(x = year, y = lifeExp, by = country,
                       color = continent)) +
  geom_line()

  #add points
ggplot(data = gap, aes(x = year, y = lifeExp, by = country,
                       color = continent)) +
  geom_line() + #line point will be drwan first
  geom_point()

  #only clour lines
ggplot(data = gap, aes(x = year, y = lifeExp, by = country
                       )) +
  geom_line(aes(color = continent)) + #line point will be drwan first
  geom_point()

  #dont need aes if applying to all the layer

ggplot(data = gap, aes(x = year, y = lifeExp, by = country
)) +
  geom_line(aes(color = continent)) + #line point will be drwan first
  geom_point(color = "blue") #dont need aes, setting evrything within the layer to blue


# setting scale---------------

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() +
  geom_point()    


#fixing overlapping point adding transparency

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() +
  geom_point(alpha = 0.4) +  
  geom_smooth(method = "lm") + 
  theme_bw()+
  ggtitle("Effects of per-capita GDP on Life Expectancy")+
  xlab("GDP per capita ($)") + 
  ylab ("life expectancy (years)")

#save plot you can  export the figure using the export button but that is lame

ggsave(filename = "results/lifeexp_per_GPRperCap.jpeg")
?ggsave


#faceting ----------------#
#useful if you want to break up the data


ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp, color = gap$continent)) +
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = "lm") +
  facet_wrap(~year)




















































































































