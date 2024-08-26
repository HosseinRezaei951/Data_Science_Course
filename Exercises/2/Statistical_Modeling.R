## First, We have to run the script in first exercise 
## to load dataset and clean and prepare data.
# lm is used to fit linear models.In this case "log(sale.price.n) = log(gross.sqft)" 
# is formula for "model1" and data will exteract from "manhattanDataSet.homes" 
model1 <- lm(log(sale.price.n) ~ log(gross.sqft), data = manhattanDataSet.homes)

## what's going on here?
# showing all the data in "manhattanDataSet.homes" dataset which "gross.sqft=0"  
manhattanDataSet.homes[which(manhattanDataSet.homes$gross.sqft == 0),]

# Recreating new DataSet as "manhattanDataSet.homes" which contains 
# the mmanhattanDataSet.homes with "gross.sqft > 0" & "land.sqft > 0"
manhattanDataSet.homes <- manhattanDataSet.homes[which(manhattanDataSet.homes$gross.sqft > 0 & manhattanDataSet.homes$land.sqft > 0),]

# Recreating new "model1" with "log(sale.price.n) = log(gross.sqft)" 
# is formula and data will exteract from "manhattanDataSet.homes"
model1 <- lm(log(sale.price.n) ~ log(gross.sqft), data = manhattanDataSet.homes)

# Showing summry of "model1"
summary(model1)

# Drawing a plot with "log(manhattanDataSet.homes$gross.sqft) for x-coordinate
# and log(manhattanDataSet.homes$sale.price.n) for y-coordinate"
plot(log(manhattanDataSet.homes$gross.sqft), log(manhattanDataSet.homes$sale.price.n))

# Add line to plot which "model1" predicted it 
abline(model1, col = "red", lwd = 2)

# Drawing  a plot which extracts model residuals from "model1" returned by modeling functions. 
plot(resid(model1))

# Creating new "model2" with "log(sale.price.n) = log(land.sqft) + factor(neighborhood)" 
# is formula and data will exteract from "manhattanDataSet.homes"
model2 <- lm(log(sale.price.n) ~ log(gross.sqft) +
log(land.sqft) + factor(neighborhood), data = manhattanDataSet.homes)

# Showing summry of "model2"
summary(model2)

# Drawing  a plot which extracts model residuals from "model2" returned by modeling functions.
plot(resid(model2))

## leave out intercept for ease of interpretability
# Creating new "model2a" with "log(sale.price.n) = 0 + log(gross.sqft) +
# log(land.sqft) + factor(neighborhood)" is formula and
# data will exteract from "manhattanDataSet.homes".
# in this case using 0 in formula to leave out intercept
model2a <- lm(log(sale.price.n) ~ 0 + log(gross.sqft) +
log(land.sqft) + factor(neighborhood), data = manhattanDataSet.homes)

# Showing summry of "model2"
summary(model2a)

# Drawing  a plot which extracts model residuals from "model2a" returned by modeling functions.
plot(resid(model2a))

## add building type
# Creating new "model3" with "log(sale.price.n) = log(gross.sqft) +
# log(land.sqft) + factor(neighborhood) + factor(building.class.category)" is formula and
# data will exteract from "manhattanDataSet.homes".
model3 <- lm(log(sale.price.n) ~ log(gross.sqft) +
log(land.sqft) + factor(neighborhood) +
factor(building.class.category), data = manhattanDataSet.homes)

# Showing summry of "model3"
summary(model3)

# Drawing  a plot which extracts model residuals from "model3" returned by modeling functions.
plot(resid(model3))

## interact neighborhood and building type
# Creating new "model4" with "log(sale.price.n) = log(gross.sqft) +
# log(land.sqft) + factor(neighborhood) * factor(building.class.category)" is formula and
# data will exteract from "manhattanDataSet.homes".
model4 <- lm(log(sale.price.n) ~ log(gross.sqft) +
log(land.sqft) + factor(neighborhood) *
factor(building.class.category), data = manhattanDataSet.homes)

# Showing summry of "model4"
summary(model4)

# Drawing  a plot which extracts model residuals from "model4" returned by modeling functions.
plot(resid(model4))
