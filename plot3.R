plot3 <- function() {
  
  ## Read in the data
  # This script assumes that the dataset resides in the current working directory
  # filename = "household_power_consumption.txt"
  fname = "household_power_consumption.txt"
  
  # read in the data
  test <- read.table(fname, sep=";", skip=grep("1/2/2007", 
                                               readLines(fname)), nrows= (24*60*2))
  # read in the column names as characters
  cnames <- read.table(fname, sep=";", nrows= 1, as.is=c(1:9))
  # assign column names
  names(test) <- cnames
  
  # convert to dates: (why?)
  test$V1 <- as.Date(test$V1, "%d/%m/%Y")
  # convert to times:
  # why?
  
  # First, reset the plot parameters and close any open connections if any
  dev.off()

  ## Make the plot
  with(test, plot(Sub_metering_1, ylab = "Energy sub metering", 
                  xaxt="n", xlab="", type="l"))
  with(test, points(Sub_metering_2, col="red", type="l"))
  with(test, points(Sub_metering_3, col="blue", type="l"))
  
  # Add the x-axis names for the days
  axis(1, at=c(1,24*60,24*60*2), labels=c("Thu", "Fri", "Sat"))
  
  # Add the legend
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         lwd=1, col=c("black", "red", "blue"), text.width=500, xjust=1, yjust=1)
  
  ## Write the plot to a png file
  dev.copy(png, file="plot3.png", width = 480, height = 480, units = "px")
  # close the graphics device (the file)
  dev.off()
}