# Set Working Drive
setwd("~/Google Drive/Data Science/Foreign Exchange Data")

# Install/Load Packages 
# install.packages("devtools")
library(devtools)
install_github('quandl/R-package')
library(Quandl)
library(ggplot2)
library(gtable)
library(grid)

# If you don't have an API key for Quandl, you'll need to get one
# Go to https://www.quandl.com
# After you sign up for a free account, go to: https://www.quandl.com/account/api
# There you will find your API key to be inserted below
# Quandl API Key  

Quandl.api_key("####### INSERT HERE #####")

#########################################################

# Choose your starting date
sdate = "2015-01-01"

#########################################################
#########################################################


# Euro Currency Data, How many Euros does a Dollar Buy? 
fxuseu = Quandl("BOE/XUDLERD")

fxuseu <- fxuseu[fxuseu$Date>=sdate,]
fxuseu$country <- "Eurozone"
# Convert the value from >> Euros per Dollar >> to >> Dollars per Euro
#fxuseu$Value <- 1/fxuseu$Value
# Create an index value from a specific date 
fxuseum <- min(fxuseu$Date)
fxuseu1 <- fxuseu[fxuseu$Date==fxuseum,]
# Create an index to track percentage change over time 
fxuseu$index <- fxuseu$Value/fxuseu1$Value

# Plot the nominal exchange rate over time 
euimg <- ggplot(fxuseu, aes(y=Value, x=Date)) + geom_point(stat="identity")
euimg <- euimg + ggtitle("Euros per USD")+labs(y="Exchange Rate", x="Date")
euimg

# Plot the relative change in exchange rate over time 
euimg2 <- ggplot(fxuseu, aes(y=index, x=Date)) + geom_point(stat="identity")
euimg2 <- euimg2 + ggtitle("Change in USD vs Euro")+labs(y="Index", x="Date")
euimg2

#########################################################
#########################################################


# U.K. Pound Data, How many Pounds does a Dollar Buy?
fxusuk = Quandl("BOE/XUDLUSS")
fxusuk <- fxusuk[fxusuk$Date>=sdate,]
fxusuk$country <- "United Kingdom"
# Convert the value from >> Dollars per Pound >> to >> Pounds per Dollar
fxusuk$Value <- 1/fxusuk$Value
# Create an index value from a specific date 
#fxusuk1 <- fxusuk[min(fxusuk$Date),]
fxusukm <- min(fxusuk$Date)
fxusuk1 <- fxusuk[fxusuk$Date==fxusukm,]

# Create an index to track percentage change over time 
fxusuk$index <- fxusuk$Value/fxusuk1$Value

# Plot the nominal exchange rate over time 
ukimg <- ggplot(fxusuk, aes(y=Value, x=Date)) + geom_point(stat="identity")
ukimg <- ukimg + ggtitle("Pounds per USD")+labs(y="Exchange Rate", x="Date")
ukimg

# Plot the relative change in exchange rate over time 
ukimg2 <- ggplot(fxusuk, aes(y=index, x=Date)) + geom_point(stat="identity")
ukimg2 <- ukimg2 + ggtitle("Change in Dollar vs. Sterling")+labs(y="Index", x="Date")
ukimg2

#########################################################
#########################################################

# Australia - Australian Dollar

fxusau = Quandl("BOE/XUDLADD")
fxusau <- fxusau [fxusau $Date>=sdate,]
fxusau$country <- "Australia"
fxusaum <- min(fxusau$Date)
fxusau1 <- fxusau[fxusau$Date==fxusaum,]
fxusau$index <- fxusau$Value/fxusau1$Value

auimg <- ggplot(fxusau, aes(y=Value, x=Date)) + geom_point(stat="identity")
auimg <- auimg + ggtitle("Australian Dollars per USD")+labs(y="Exchange Rate", x="Date")
auimg

auimg2 <- ggplot(fxusau, aes(y=index, x=Date)) + geom_point(stat="identity")
auimg2 <- auimg2 + ggtitle("Change in USD vs Aussie Dollar")+labs(y="Index", x="Date")
auimg2

#########################################################
#########################################################

# South African Rand to USD

fxussa <- Quandl("BOE/XUDLZRD")
fxussa <- fxussa[fxussa$Date>=sdate,]
fxussa$country <- "South Africa"
fxussam <- min(fxussa$Date)
fxussa1 <- fxussa[fxussa $Date==fxussam,]
fxussa$index <- fxussa$Value/fxussa1$Value

saimg <- ggplot(fxussa, aes(y=Value, x=Date)) + geom_point(stat="identity")
saimg <- saimg + ggtitle("South African Rand per USD")+labs(y="Exchange Rate", x="Date")
saimg

saimg2 <- ggplot(fxussa, aes(y=index, x=Date)) + geom_point(stat="identity")
saimg2 <- saimg2 + ggtitle("Change in Dollar vs Rand")+labs(y="Index", x="Date")
saimg2

#########################################################
#########################################################

# Swedish Krona to USD 
# Swedish Krona Data, How many Krona does a US Dollar Buy?

fxuskr <- Quandl("BOE/XUDLSKD")
fxuskr <- fxuskr[fxuskr$Date>=sdate,]
fxuskr$country <- "Sweden"
fxuskrm <- min(fxuskr$Date)
fxuskr1 <- fxuskr[fxuskr$Date==fxuskrm,]
fxuskr$index <- fxuskr$Value/fxuskr1$Value

krimg <- ggplot(fxuskr, aes(y=Value, x=Date)) + geom_point(stat="identity")
krimg <- krimg + ggtitle("Kronas per USD")+labs(y="Exchange Rate", x="Date")
krimg

krimg2 <- ggplot(fxuskr, aes(y=index, x=Date)) + geom_point(stat="identity")
krimg2 <- krimg2 + ggtitle("Change in Dollar vs. Krona")+labs(y="Index", x="Date")
krimg2

#########################################################
#########################################################

# Swiss Franc to USD 

fxusfr  <- Quandl("BOE/XUDLSFD")
fxusfr <- fxusfr[fxusfr$Date>=sdate,]
fxusfr$country <- "Switzerland"
fxusfrm <- min(fxusfr$Date)
fxusfr1 <- fxusfr[fxusfr$Date==fxusfrm,]
fxusfr$index <- fxusfr$Value/fxusfr1$Value

frimg <- ggplot(fxusfr, aes(y=Value, x=Date)) + geom_point(stat="identity")
frimg <- frimg + ggtitle("Swiss Francs per USD")+labs(y="Exchange Rate", x="Date")
frimg

frimg2 <- ggplot(fxusfr, aes(y=index, x=Date)) + geom_point(stat="identity")
frimg2 <- frimg2 + ggtitle("Change in Dollar vs. Franc")+labs(y="Index", x="Date")
frimg2

#########################################################
#########################################################

# Japanese Yen to USD 

fxusyn <- Quandl("BOE/XUDLJYD")
fxusyn <- fxusyn[fxusyn$Date>=sdate,]
fxusyn$country <- "Japan"
fxusynm <- min(fxusyn$Date)
fxusyn1 <- fxusyn[fxusyn $Date==fxusynm,]
fxusyn$index <- fxusyn$Value/fxusyn1$Value

ynimg <- ggplot(fxusyn, aes(y=Value, x=Date)) + geom_point(stat="identity")
ynimg <- ynimg + ggtitle("Yen per USD")+labs(y="Exchange Rate", x="Date")
ynimg

ynimg2 <- ggplot(fxusyn, aes(y=index, x=Date)) + geom_point(stat="identity")
ynimg2 <- ynimg2 + ggtitle("Change in Dollar vs. Yen")+labs(y="Index", x="Date")
ynimg2

#########################################################
#########################################################

# Brazil FOREX : USD to Real 

fxusbr = Quandl("CURRFX/USDBRL")
fxusbr <- fxusbr [fxusbr $Date>sdate,]
fxusbr$country <- "Brazil"
fxusbrm <- min(fxusbr$Date)
fxusbr1 <- fxusbr[fxusbr$Date==fxusbrm,]
fxusbr$index <- fxusbr$Rate/fxusbr1$Rate

brimg <- ggplot(fxusbr, aes(y=Rate, x=Date)) + geom_point(stat="identity")
brimg <- brimg + ggtitle("Brazilian Reais per USD")+labs(y="Exchange Rate", x="Date")
brimg

brimg2 <- ggplot(fxusbr, aes(y=index, x=Date)) + geom_point(stat="identity")
brimg2 <- brimg2 + ggtitle("Change in Dollar vs Real")+labs(y="Index", x="Date")
brimg2

#########################################################
#########################################################

# Colombia 
# Colombia FOREX: USD to Colombian Peso 

fxusco = Quandl("CURRFX/USDCOP")
fxusco <- fxusco [fxusco $Date>=sdate,]
fxusco$country <- "Colombia"
fxuscom <- min(fxusco$Date)
fxusco1 <- fxusco [fxusco$Date==fxuscom,]
fxusco$index <- fxusco$Rate/fxusco1$Rate
# Data cleaning issue - need to drop extraneous entries for helping scale graph
fxusco <- fxusco[fxusco$Rate>1000,]

coimg <- ggplot(fxusco, aes(y=Rate, x=Date)) + geom_point(stat="identity")
coimg <- coimg + ggtitle("Colombian Pesos per Dollar")+labs(y="Exchange Rate", x="Date")
coimg

coimg2 <- ggplot(fxusco, aes(y=index, x=Date)) + geom_point(stat="identity")
coimg2 <- coimg2 + ggtitle("Change in USD vs Colombian Peso")+labs(y="Index", x="Date")
coimg2

#########################################################
#########################################################

# Denmark - Danish Krone 

fxusdn <- Quandl("BOE/XUDLDKD")
fxusdn <- fxusdn[fxusdn$Date>=sdate,]
fxusdn$country <- "Denmark"
fxusdnm <- min(fxusdn$Date)
fxusdn1 <- fxusdn[fxusdn $Date==fxusdnm,]
fxusdn$index <- fxusdn$Value/fxusdn1$Value

dnimg <- ggplot(fxusdn, aes(y=Value, x=Date)) + geom_point(stat="identity")
dnimg <- dnimg + ggtitle("Danish Krones per USD")+labs(y="Exchange Rate", x="Date")
dnimg

dnimg2 <- ggplot(fxusdn, aes(y=index, x=Date)) + geom_point(stat="identity")
dnimg2 <- dnimg2 + ggtitle("Change in USD vs Danish Krone")+labs(y="Index", x="Date")
dnimg2

#########################################################
#########################################################

str(fxusbr)
str(fxusco)

# Drop High and Low columns from Brazil and Colombia data for merging

fxusbr_2 <- fxusbr[-3:-4]
colnames(fxusbr_2) <- c("Date", "Value", "country", "index")
fxusco_2 <- fxusco[-3:-4]
colnames(fxusco_2) <- c("Date", "Value", "country", "index")
str(fxuseu)
str(fxusbr_2)

# Create Comparative Chart for Assessing Relative Strength of USD vs Basket of Other Currencies

index <- rbind(fxusfr, fxusyn, fxuseu, fxusuk, fxusau, fxusdn, fxuskr, fxusbr_2, fxusco_2)

inimg <- ggplot(index, aes(y=index, x=Date, colour=country)) + geom_line(stat="identity")
inimg <- inimg + ggtitle("Currencies Indexed in 2015 USD")+labs(y="Index", x="Date")
inimg
