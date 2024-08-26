# using some packages for some functions
require(plyr)
require(gdata)

# reading manhattan excel file into manhattanDataSet
manhattanDataSet <- read.xls("rollingsales_manhattan.xls",pattern="BOROUGH" ,perl = "D:\\Strawberry\\perl\\bin\\perl.exe")

# return the first parst of manhattanDataSet
head(manhattanDataSet)

# return result summaries of the manhattanDataSet elements (Max, Min, ...) 
summary(manhattanDataSet)

# create new column in manhattanDataSet as "SALE.PRICE.N" and convert the "SALE.PRICE" values to numeric values
manhattanDataSet$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]", "", manhattanDataSet$SALE.PRICE))

# count how many elements of "SALE.PRICE.N" is not assigned
count(is.na(manhattanDataSet$SALE.PRICE.N))

# convert names of manhattanDataSet columns to lowercase 
names(manhattanDataSet) <- tolower(names(manhattanDataSet))



## clean/format the data with regular expressions
# create new column in manhattanDataSet as "gross.sqft" and convert the "gross.square.feet" values to numeric values
manhattanDataSet$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", manhattanDataSet$gross.square.feet))

# create new column in manhattanDataSet as "land.sqft" and convert the "land.square.feet" values to numeric values
manhattanDataSet$land.sqft <- as.numeric(gsub("[^[:digit:]]","", manhattanDataSet$land.square.feet))

# convert the "sale.date" of manhattanDataSet values to Date values
manhattanDataSet$sale.date <- as.Date(manhattanDataSet$sale.date)

# convert the "year.built" of manhattanDataSet values to numeric values
manhattanDataSet$year.built <- as.numeric(as.character(manhattanDataSet$year.built))



## do a bit of exploration to make sure there's not anything weird going on with sale prices
# attach the manhattanDataSet to the R search path 
attach(manhattanDataSet)

# drawing a histogram of "sale.price.n" column in manhattanDataSet that attached before
hist(sale.price.n)

# drawing a histogram of "sale.price.n" column which is sale.price.n>0 
hist(sale.price.n[sale.price.n>0])

# drawing a histogram of "gross.sqft" column which is sale.price.n>0 
hist(gross.sqft[sale.price.n==0])

# detach the manhattan DataSet from the R search path
detach(manhattanDataSet)



## keep only the actual sales
# creating new DataSet as "manhattanDataSet.sale" which contains the manhattanDataSet that is sale.price.n!=0
manhattanDataSet.sale <- manhattanDataSet[manhattanDataSet$sale.price.n!=0,]

# drawing a plot with "manhattanDataSet.sale$gross.sqft for x-coordinate
# and manhattanDataSet.sale$sale.price.n for y-coordinate"
plot(manhattanDataSet.sale$gross.sqft,manhattanDataSet.sale$sale.price.n)

# drawing a plot with "log(manhattanDataSet.sale$gross.sqft) for x-coordinate
# and log(manhattanDataSet.sale$sale.price.n) for y-coordinate"
# this log function will reduce the scale of input data
plot(log(manhattanDataSet.sale$gross.sqft),log(manhattanDataSet.sale$sale.price.n))



## for now, let's look at 1-, 2-, and 3-family homes
# creating new DataSet as "manhattanDataSet.homes" which contains 
# the manhattanDataSet.sale that has rows with building.class.category containing "FAMILY" string
manhattanDataSet.homes <- manhattanDataSet.sale[which(grepl("FAMILY", manhattanDataSet.sale$building.class.category)),]

# drawing a plot with "log(manhattanDataSet.homes$gross.sqft) for x-coordinate
# and log(manhattanDataSet.homes$sale.price.n) for y-coordinate"
plot(log(manhattanDataSet.homes$gross.sqft),log(manhattanDataSet.homes$sale.price.n))

# showing manhattanDataSet.homes which their sale.price.n<100000 in ascending order of their sale.price.n
manhattanDataSet.homes[which(manhattanDataSet.homes$sale.price.n<100000),][order(manhattanDataSet.homes[which(manhattanDataSet.homes$sale.price.n<100000),] $sale.price.n),]



## remove outliers that seem like they weren't actual sales
# create new column in manhattanDataSet.homes as "outliers" (if their sale.price.n is bigger than 10^5 value is 0 otherwise 1)
manhattanDataSet.homes$outliers <- (log(manhattanDataSet.homes$sale.price.n) <=5) + 0

# recreating new DataSet as "manhattanDataSet.homes" which contains 
# the mmanhattanDataSet.homes with outliers==0
manhattanDataSet.homes <- manhattanDataSet.homes[which(manhattanDataSet.homes$outliers==0),]

# drawing a plot with "log(manhattanDataSet.homes$gross.sqft) for x-coordinate
# and log(manhattanDataSet.homes$sale.price.n) for y-coordinate"
plot(log(manhattanDataSet.homes$gross.sqft),log(manhattanDataSet.homes$sale.price.n))

