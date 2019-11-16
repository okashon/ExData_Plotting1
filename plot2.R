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

#######Plotting "PLOT 2.png"#####

png("plot2.png",width = 480, height = 480)

dataset <- mutate(dataset,Date_time = paste(Date,Time))
head(dataset)

dataset$Date_time <- as.POSIXct(dataset$Date_time,tz="EST5EDT")
head(dataset)
class(dataset$Date_time)

plot(dataset$Date_time,as.numeric(as.character(dataset$Global_active_power)),type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()
