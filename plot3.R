df <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)

# Subset the data per the two dates being analysed
df <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

# Data type conversions
df[,"Date"] <- as.Date(as.character(df$Date), format="%d/%m/%y") 

df[,"Sub_metering_1"] <- as.numeric(as.character(df[,"Sub_metering_1"]))
df[,"Sub_metering_2"] <- as.numeric(as.character(df[,"Sub_metering_2"]))
df[,"Sub_metering_3"] <- as.numeric(as.character(df[,"Sub_metering_3"]))

#Create png graphics device 
png(filename = "plot3.png", width=480, height=480)

# Plot all 3 sub metering series
plot(df$Sub_metering_1, xlab="", ylab="Energy sub metering", 
     type="l", xaxt = "n")
lines(df$Sub_metering_2, col="red")
lines(df$Sub_metering_3, col="blue")

# Add legend to the plot
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Find the index (row) number corresponding with the first observation on 2/2/2007
friPos <- which(df$Date == as.Date("2/2/2007", format="%d/%m/%y"))[1]
# Find the index (row) number of the last observation in the data subset
satPos <- dim(df)[1]
axis(1, at=c(1,friPos,satPos), labels=c("Thu","Fri","Sat"))

dev.off()