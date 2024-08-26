# Loading some requirements
require(gdata)
require(geoPlot)
require(class)

# Set working directory  to "F:/1.Me/darsi/Data Science/Assignments/2/HosseinRezaei/KNN"
setwd("F:/1.Me/darsi/Data Science/Assignments/2/HosseinRezaei/KNN")

# Loading Manhattan dataset to "mt" from "rollingsales_manhattan.xls" file
mt <- read.xls("rollingsales_manhattan.xls",pattern="BOROUGH",stringsAsFactors=FALSE)

# Showing the first part of "mt" dataset
head(mt)

# Showing summry of "mt"
summary(mt)

# Convert names of "mt" columns to lowercase 
names(mt) <- tolower(names(mt))

# Recreate new column in "mt" as "sale.price.n" and convert the "sale.price.n" values to numeric values
mt$sale.price.n <- as.numeric(gsub("[^[:digit:]]","",mt$sale.price))

# Showing number of rows of "sale.price.n" column that hasn't any value
sum(is.na(mt$sale.price.n))

# Showing number of rows of "sale.price.n" column that "sale.price.n==0"
sum(mt$sale.price.n==0)

# Convert names of "mt" columns to lowercase 
names(mt) <- tolower(names(mt))


## clean/format the data with regular expressions
# create new column in "mt" as "gross.sqft" and convert the "gross.square.feet" values to numeric values
mt$gross.sqft <- as.numeric(gsub("[^[:digit:]]","",mt$gross.square.feet))

# create new column in "mt" as "land.sqft" and convert the "land.square.feet" values to numeric values
mt$land.sqft <- as.numeric(gsub("[^[:digit:]]","",mt$land.square.feet))

# convert the "sale.date" of "mt" values to Date values
mt$sale.date <- as.Date(mt$sale.date)

# convert the "year.built" of "mt" values to numeric values
mt$year.built <- as.numeric(as.character(mt$year.built))

# convert the "zip.code" of "mt" values to character values
mt$zip.code <- as.character(mt$zip.code)


## - standardize data (set year built start to 0; land and
## gross sq ft; sale price (exclude $0 and possibly others); possi
## bly tax block; outside dataset for coords of tax block/lot?)
min_price <- 10000
mt <- mt[which(mt$sale.price.n>=min_price),]
n_obs <- dim(mt)[1]
mt$address.noapt <- gsub("[,][[:print:]]*","",gsub("[ ]+"," ",trim(mt$address)))
mt_add <- unique(data.frame(mt$address.noapt,mt$zip.code,stringsAsFactors=FALSE))
names(mt_add) <- c("address.noapt","zip.code")
mt_add <- mt_add[order(mt_add$address.noapt),]

#find duplicate addresses with different zip codes
dup <- duplicated(mt_add$address.noapt)

# remove them
dup_add <- mt_add[mt_add$dup,1]
mt_add <- mt_add[(mt_add$address.noapt != dup_add[1] & mt_add$address.noapt != dup_add[2]),]
n_add <- dim(mt_add)[1] 

# sample 500 addresses so we don't run over our Google Maps 
# API daily limit (and so we're not waiting forever)
n_add <- dim(mt_add)[1]

# sample 500 addresses so we don't run over our Google Maps 
# API daily limit (and so we're not waiting forever)
n_sample <- 500
add_sample <- mt_add[sample.int(n_add,size=n_sample),]

# first, try a query with the addresses we have
query_list <- addrListLookup(data.frame(1:n_sample,add_sample$address.noapt,rep("NEW YORK",times=n_sample),rep("NY",times=n_sample),add_sample$zip.code,rep("US",times=n_sample)))[,1:4]
query_list$matched <- (query_list$latitude != 0)
unmatched_inds <- which(!query_list$matched)
unmatched <- length(unmatched_inds)

# try changing EAST/WEST to E/W
query_list[unmatched_inds,1:4] <- addrListLookup(data.frame(1:unmatched,gsub(" WEST "," W ",gsub(" EAST "," E ",add_sample[unmatched_inds,1])),rep("NEW YORK",times=unmatched), rep("NY",times=unmatched),add_sample[unmatched_inds,2],rep("US",times=unmatched)))[,1:4]
query_list$matched <- (query_list$latitude != 0)
unmatched_inds <- which(!query_list$matched)
unmatched <- length(unmatched_inds)

# try changing STREET/AVENUE to ST/AVE
query_list[unmatched_inds,1:4] <- addrListLookup(data.frame(1:unmatched,gsub(" WEST "," W ",gsub(" EAST "," E ",gsub(" STREET"," ST",gsub(" AVENUE"," AVE",add_sample[unmatched_inds,1])))),rep("NEW YORK",times=unmatched), rep("NY",times=unmatched),add_sample[unmatched_inds,2],rep("US",times=unmatched)))[,1:4]
query_list$matched <- (query_list$latitude != 0)
unmatched_inds <- which(!query_list$matched)
unmatched <- length(unmatched_inds)

## have to be satisfied for now
add_sample <- cbind(add_sample,query_list$latitude,query_list$longitude)
names(add_sample)[3:4] <- c("latitude","longitude")
add_sample <- add_sample[add_sample$latitude!=0,]
add_use <- merge(mt,add_sample)
add_use <- add_use[!is.na(add_use$latitude),]

# map coordinates
map_coords <- add_use[,c(2,4,26,27)]
table(map_coords$neighborhood)
map_coords$neighborhood <- as.factor(map_coords$neighborhood)
geoPlot(map_coords,zoom=12,color=map_coords$neighborhood)

## - knn function
## - there are more efficient ways of doing this,
## but oh well...
map_coords$class <- as.numeric(map_coords$neighborhood)
n_cases <- dim(map_coords)[1]
split <- 0.8
train_inds <- sample.int(n_cases,floor(split*n_cases))
test_inds <- (1:n_cases)[-train_inds]
k_max <- 10
knn_pred <- matrix(NA,ncol=k_max,nrow=length(test_inds))
knn_test_error <- rep(NA,times=k_max)

for (i in 1:k_max) {
knn_pred[,i] <- knn(map_coords[train_inds,3:4],map_coords[test_inds,3:4],cl=map_coords[train_inds,5],k=i)
knn_test_error[i] <- sum(knn_pred[,i]!=map_coords[test_inds,5])/length(test_inds)
}

plot(1:k_max,knn_test_error)
