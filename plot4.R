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
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(df,{
    plot(datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(datetime,Voltage, type="l", xlab = "datetime", ylab = "Voltage")
})
with(df,{
    plot(datetime,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering")
    points(datetime,Sub_metering_1, col="black", type="l")
    points(datetime,Sub_metering_2, col="red", type="l")
    points(datetime,Sub_metering_3, col="blue", type="l")
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
})
with(df,plot(datetime,Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()