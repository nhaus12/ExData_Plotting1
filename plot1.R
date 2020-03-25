df <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)

# Subset the data per the two dates being analysed
df <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")

# Convert Global Active Power data to numeric type
df[,"Global_active_power"] <- as.numeric(as.character(df[,"Global_active_power"]))

#Create png graphics device 
png(filename = "plot1.png", width=480, height=480)

hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")

dev.off()