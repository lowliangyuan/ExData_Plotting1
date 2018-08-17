# Read the data.
df<-read.table("household_power_consumption.txt",na.strings = "?",sep=";",header=TRUE)

# Convert the Date variables to Date classes.
df<-transform(df,Date=as.Date(Date,format="%d/%m/%Y"))

# Subsetting the required dataset.
library(dplyr)
df<-filter(df,Date>="2007-02-01" & Date <= "2007-02-02")

# Plotting the graphs and saving as PNG file.
png("plot1.png", width=480, height=480)
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()