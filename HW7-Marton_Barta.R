library(data.table)
library(plyr)
library(dplyr)
data <- read.csv("iris.csv")

## Question 1
peek <- function(data, x = ncol(data))
{
  if (is.data.table(data)) data[1:5, 1:x, with = FALSE]
  else if (is.data.frame(data) | is.matrix(data)) data[1:5, 1:x] 
}

peek(data)


## Question 2
# print the last 2 rows in the last 2 columns to the R terminal
data[c((dim(data)[1]-1),dim(data)[1]),c((dim(data)[2]-1),dim(data)[2])]


# get the number of observations for each species included in the data set                                                                        
count(data, 'Species') 

# get rows with Sepal.Width > 3.5
data %>%
  filter(Sepal.Width>3.5)

# write the data for the species setosa to a comma-delimited file names ‘setosa.csv’
write.csv(data %>%
            filter(Species=="setosa"), "setosa.csv")

#calculate the mean, minimum, and maximum of Petal.Length for observations from virginica
data %>%
  filter(Species == "virginica") %>%
  select(Sepal.Length) %>%
  summarise(mean=round(mean(Sepal.Length),2), minimum = min(Sepal.Length) , maximum=max(Sepal.Length))
