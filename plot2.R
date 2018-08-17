# Read the data.
df<-read.table("household_power_consumption.txt",na.strings = "?",sep=";",header=TRUE)

# Convert the Date variables to Date classes.
df<-transform(df,Date=as.Date(Date,format="%d/%m/%Y"))

# Subsetting the required dataset.
library(dplyr)
df<-filter(df,Date>="2007-02-01" & Date <= "2007-02-02")

# Convert the Time variables to Time classes.
df<-mutate(df,datetime=paste(Date,Time))
df<-transform(df,datetime=strptime(datetime,format="%Y-%m-%d %H:%M:%S"))

# Plotting the graphs and saving as PNG file.
png("plot2.png", width=480, height=480)
with(df, plot(datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()