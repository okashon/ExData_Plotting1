######READING THE DATASET######

library(dplyr)

data<-read.table("Your/Data/Path",sep = ";",header = TRUE,dec =".")
head(data)

#####transforming Variable Date into date class

data$Date <-as.Date(data$Date, "%d/%m/%Y") 
head(data)
class(data$Date)

########Subsetting data#####

dataset<-filter(data,Date >= "2007-02-01" & Date <= "2007-02-02")
head(dataset)

#######Plotting "PLOT 3.png"#####

png("plot3.png",width = 480, height = 480)

plot(dataset$Date_time,as.numeric(as.character(dataset$Sub_metering_1)),type = "l",xlab = "",ylab = "Energy sub metering")
lines(dataset$Date_time,as.numeric(as.character(dataset$Sub_metering_2)),col="red",type = "l")
lines(dataset$Date_time,as.numeric(as.character(dataset$Sub_metering_3)),col="blue",type = "l")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"))

dev.off()
