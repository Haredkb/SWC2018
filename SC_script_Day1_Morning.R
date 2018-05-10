#going to talk about data structures in R
# c is combine
#going to make a data frame
cats <- data.frame(coat = c("calico", "black","tabby"),
                   weight = c( 2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

cats

#look at columns within the data frames

cats$weight
cats$coat #shows levels

cats$weight + 2 

cats$weight + cats$coat #example error, trying to preform a fucntion on two different types of classes
class(cats$weight) # to determine the class of the column
class(cats$coat) 

str(cats) #determine the structure of the data frame

#factors are intersting, the store categorical vector, like strings, but have levels, factors can be ordered. int the factors currently in alphabetical order!! (the 2 1 3)

str(cats$coat) 

#say if we want to change the order of the levels, we can do this using the factor function

cats$coat_reorder <- factor(x = cats$coat, 
                            levels = c("tabby", "calico", "black"),
                            ordered = TRUE)

str(cats$coat_reorder)
levels(cats$coat_reorder)

write.csv(x = cats, 
          "data/felinedata.csv")

#exploring dataframes
  # and manipulate!

#read in the data

gap <- read.csv(file = "data/gapminder-FiveYearData.csv") #working in a project you are automaticlally wokriin gin the right directory!!! right folder then tab to auto complete


head(gap) #this fucntion will show us the top six rows- good for visualization
str(gap)

#cats <- read.csv(file = "data\felinedata.csv") #example to determine auto populate

# we can also dtermine number of row using the following function

nrow(gap)
ncol(gap)
dim(gap) # rows first then the number of columns this gives you the full dimensions
colnames(gap) # gives us all the column names

#Subsetting the data

#lets start with basics

x <- c(5, 4, 7, 4, 7.5)
#we can name these
names(x) <- c("A", "B", "C", "D", "E")

#if we only want to access a certain value we use square brackets

x[3] #gets the third element
x[c(1,3)] # gets first and thrid
#we can also get slices

x[1:4] #first four values in the vector

x[-4] #remove vectors from call
x[-(2:4)]#if we want to remove the center of the vector, or consectutive values, you could also use the combine fucntion here

#lets subset a real data frame

head(gap[1]) #returns only the first six cnumber in the first row, or by (see below)
head(gap["pop"])
head(gap[,1])
gap[3,] #right refers to column, left refers to rows

gap[138,] #call only one row

#lets say you only want to look at albania data

albania <- gap[13:24,c(1,3:6)]

#test your knowledge try to write only afghan, then calculate GDP and make it a new column- then export
afgh <- gap[1:12,] #all columns returned
afgh$gdp <- afgh$pop * afgh$gdpPercap
write.csv(afgh, "results/afghdata.csv")

#but that means we had to know what rows are afgh, we will learn that tomorrow...















