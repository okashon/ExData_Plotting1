######READING THE DATASET######

library(dplyr)

data<-read.table("/your/data/path",sep = ";",header = TRUE)
head(data)

#####transforming Variable Date into date class

data$Date <-as.Date(data$Date, "%d/%m/%Y") 
head(data)
class(data$Date)

########Subsetting data#####

dataset<-filter(data,Date >= "2007-02-01" & Date <= "2007-02-02")
head(dataset)

####Removing "?" if any

dataset2 <- dataset[dataset$Global_reactive_power!="?" & 
                      dataset$Global_reactive_power!="?" & 
                      dataset$Voltage!="?" & 
                      dataset$Global_intensity!="?" & 
                      dataset$Sub_metering_1!="?" & 
                      dataset$Sub_metering_2!="?" & 
                      dataset$Sub_metering_3!="?", ]

####changing variables to numeric class

#Global Active Power
dataset2$Global_active_power <- as.numeric(dataset2$Global_active_power)
class(dataset2$Global_active_power)

#Global Reactive Power
dataset2$Global_reactive_power <- as.numeric(dataset2$Global_reactive_power)
class(dataset2$Global_reactive_power)

#Voltage
dataset2$Voltage <- as.numeric(dataset2$Voltage)
class(dataset2$Voltage)

#Global Intensity
dataset2$Global_intensity <- as.numeric(dataset2$Global_intensity)
class(dataset2$Global_intensity)

#Sub Metering 1
dataset2$Sub_metering_1 <- as.numeric(dataset2$Sub_metering_1)
class(dataset2$Sub_metering_1)

#Sub Metering 2
dataset2$Sub_metering_2 <- as.numeric(dataset2$Sub_metering_2)
class(dataset2$Sub_metering_2)

#Sub Metering 3
dataset2$Sub_metering_3 <- as.numeric(dataset2$Sub_metering_3)
class(dataset2$Sub_metering_3)

#######Plotting "PLOT 1.png"#####

png("plot1.png",width = 480, height = 480)

hist(as.numeric(as.character(dataset2$Global_active_power)),
     main = "Global Active Power",xlab= "Global Active Power (kilowatts)",
     col=2,ylim = c(0,1200))

dev.off()
