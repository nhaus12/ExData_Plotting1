df <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)

# Subset the data per the two dates being analysed
df <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

# Convert Global Active Power data to numeric type
df[,"Global_active_power"] <- as.numeric(as.character(df[,"Global_active_power"]))
df[,"Date"] <- as.Date(as.character(df$Date), format="%d/%m/%y") 

#Create png graphics device 
png(filename = "plot2.png", width=480, height=480)

plot(df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", 
     type="l", xaxt = "n")

# Find the index (row) number corresponding with the first observation on 2/2/2007
friPos <- which(df$Date == as.Date("2/2/2007", format="%d/%m/%y"))[1]
# Find the index (row) number of the last observation in the data subset
satPos <- dim(df)[1]

axis(1, at=c(1,friPos,satPos), labels=c("Thu","Fri","Sat"))

dev.off()